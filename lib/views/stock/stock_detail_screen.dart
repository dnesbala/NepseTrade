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
              _buildRow("Volume", "${watchlist.tradedShares} units"),
              _buildRow("Turnover", "Rs. ${watchlist.amount}"),
              _buildRow("Max Price", "Rs. ${watchlist.maxPrice}"),
              _buildRow("Min Price", "Rs. ${watchlist.minPrice}"),
              _buildRow("Closing Price", "Rs. ${watchlist.closingPrice}"),
              _buildRow(
                  "Previous Closing Price", "Rs. ${watchlist.previousClosing}"),
              _buildRow("Difference", "Rs. ${watchlist.difference}"),
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
