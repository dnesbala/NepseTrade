import 'package:flutter/material.dart';
import 'package:frontend/controllers/stock/stock_controller.dart';
import 'package:get/get.dart';

class SearchStockDelegate extends SearchDelegate {
  final StockController stockController = Get.find<StockController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    var filteredStocks = stockController.stocks!
        .where((element) =>
            element.companyName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    print("filtered $filteredStocks");

    return filteredStocks.isEmpty
        ? Center(
            child: Text("No stocks found"),
          )
        : ListView.separated(
            separatorBuilder: (_, index) => Divider(height: 0),
            itemCount: filteredStocks.length,
            // itemCount: stockController.stocks!.length,
            itemBuilder: ((context, index) {
              var stock = filteredStocks[index];

              return ListTile(
                onTap: () {},
                title: Text(stock.companyName,
                    style: Theme.of(context).textTheme.bodyText2),
                subtitle: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Rs. ${stock.closingPrice}",
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          TextSpan(
                              text: " (Rs. ${stock.difference})",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: stock.difference.isNegative
                                        ? Colors.red
                                        : Colors.green,
                                  )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Stocks"),
    );
  }

  @override
  String? get searchFieldLabel => "Search Stock...";
}
