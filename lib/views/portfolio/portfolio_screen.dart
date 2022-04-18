import 'package:flutter/material.dart';
import 'package:frontend/config/app_links.dart';
import 'package:frontend/controllers/transaction_controller.dart';
import 'package:frontend/controllers/watchlist_controller.dart';
import 'package:frontend/widgets/label_text.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen({Key? key}) : super(key: key);

  final TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var today = DateTime.now();

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height * .15,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text("Portfolio",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.white)),
                  ),
                ),
                Positioned(
                  top: size.height * .06,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * .22,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelText(
                                value: 100000.toString(),
                                label: "Total Investment"),
                            LabelText(
                                value: 150000.toString(),
                                label: "Current Value"),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelText(
                                value: 50000.toString(), label: "Profit/Loss"),
                            LabelText(
                                value: 1500.toString(), label: "Today's P/L"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "As of ${today.year}/${today.month}/${today.day}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black87)),
                            InkWell(
                              onTap: () {},
                              child: Icon(Icons.refresh_outlined,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text("Holdings",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
            ),
            Divider(height: 0),
            Obx(() {
              var companies = <String>{};
              var allTransactions = transactionController.transactions;
              var allTx = [...allTransactions];

              allTx.retainWhere(
                  (element) => companies.add(element.stock.companyName));

              var buyUnits = 0;
              var sellUnits = 0;
              var currentUnits = 0;

              return Expanded(
                child: ListView.builder(
                    itemCount: companies.length,
                    itemBuilder: (context, index) {
                      var company = companies.toList()[index];

                      var buyTransactions = allTransactions
                          .where((element) =>
                              element.stock.companyName == company &&
                              element.type == "Buy")
                          .toList();
                      buyTransactions.forEach((element) {
                        buyUnits += element.units;
                      });

                      var sellTransactions = allTransactions
                          .where((element) =>
                              element.stock.companyName == company &&
                              element.type == "Sell")
                          .toList();
                      sellTransactions.forEach((element) {
                        sellUnits += element.units;
                      });

                      print("Buy units $buyUnits");
                      print("Sell units $sellUnits");

                      currentUnits = buyUnits - sellUnits;
                      buyUnits = 0;
                      sellUnits = 0;

                      return _buildHoldingsTile(context, company, currentUnits);
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }

  _buildHoldingsTile(
      BuildContext context, String companyName, int currentUnits) {
    var stock = WatchlistController.instance.getWatchlistInfo(companyName);

    var currentValue = stock.closingPrice * currentUnits;
    var investment = 10000;
    var overallPL = investment - currentValue;
    var overallPLPercent = (overallPL / investment) * 100;
    var todaysPL = 50;

    return ExpansionTile(
      title: Text(companyName, style: Theme.of(context).textTheme.headline6),
      subtitle: Text("$currentUnits units",
          style: Theme.of(context).textTheme.subtitle1),
      children: [
        InkWell(
          onTap: () => Get.toNamed(AppLinks.TRANSACTION),
          child: Ink(
            padding: const EdgeInsets.only(left: 20, top: 20),
            color: Colors.grey.shade100,
            child: Table(
              children: [
                TableRow(
                  children: [
                    LabelText(
                        label: "LTP",
                        value: stock.closingPrice.toString(),
                        textColor: Colors.green),
                    LabelText(
                        label: "Current Value", value: currentValue.toString()),
                    LabelText(
                        label: "Investment", value: investment.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    LabelText(
                        label: "Overall P/L",
                        value: overallPL.toString(),
                        textColor: Colors.green),
                    LabelText(
                        label: "P/L %",
                        value: overallPLPercent.toString(),
                        textColor: Colors.green),
                    LabelText(
                        label: "Today's P/L",
                        value: todaysPL.toString(),
                        textColor: Colors.green),
                  ],
                ),
                // TableRow(
                //   children: [
                //     LabelText(
                //         label: "Targets", value: item["targets"].toString()),
                //     LabelText(
                //         label: "Stop Loss",
                //         value: item["stop_loss"].toString()),
                //     SizedBox(),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
