import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/constants.dart';
import 'package:frontend/models/watchlist_model.dart';
import 'package:frontend/widgets/buy_stock_modal.dart';
import 'package:frontend/widgets/sell_stock_modal.dart';

class StockDetailScreen extends StatelessWidget {
  final Watchlist watchlist;
  const StockDetailScreen({Key? key, required this.watchlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(watchlist.companyName, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Statistics",
                style: Theme.of(context).textTheme.headline5),
          ),
          Divider(),
          Column(
            children: [
              _buildRow(
                  "No. of Transactions", watchlist.noOfTransactions.toString()),
              _buildRow("Volume", watchlist.tradedShares.toString()),
              _buildRow("Turnover", watchlist.amount.toString()),
              _buildRow("Max Price", watchlist.maxPrice.toString()),
              _buildRow("Min Price", watchlist.minPrice.toString()),
              _buildRow("Closing Price", watchlist.closingPrice.toString()),
              _buildRow("Previous Closing Price",
                  watchlist.previousClosing.toString()),
              _buildRow("Difference", watchlist.difference.toString()),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DocumentSnapshot userDoc = await fireStore
                            .collection("users")
                            .doc(firebaseAuth.currentUser!.uid)
                            .get();
                        var userBalance =
                            (userDoc.data() as Map<String, dynamic>)["balance"];
                        buyStockModal(context, watchlist,
                            double.parse(userBalance.toString()));
                      },
                      child: Text("Buy"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => sellStockModal(context, watchlist),
                      child: Text("Sell"),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(title),
          Spacer(),
          Text(value),
        ],
      ),
    );
  }
}
