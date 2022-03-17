import 'package:flutter/material.dart';
import 'package:frontend/views/transaction/widgets/transaction_tile.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  final List<Tab> tabs = [
    Tab(
      text: "All",
    ),
    Tab(
      text: "Buy",
    ),
    Tab(
      text: "Sell",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Transactions",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined, color: Colors.white)),
            ],
          ),
          body: Column(
            children: [
              Material(
                color: Colors.grey.shade200,
                child: TabBar(
                  tabs: tabs,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  labelColor: Colors.black,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              TransactionTile(
                name: "RLI",
                date: "2022/02/05",
                type: "Buy",
                units: 500,
                price: 610.5,
              ),
              TransactionTile(
                name: "SPDL",
                date: "2022/02/05",
                type: "Buy",
                units: 500,
                price: 610.5,
              ),
              TransactionTile(
                name: "NABIL",
                date: "2022/02/05",
                type: "Sell",
                units: 200,
                price: 1100,
              ),
              TransactionTile(
                name: "ICFC",
                date: "2022/02/06",
                type: "Buy",
                units: 50,
                price: 630,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
