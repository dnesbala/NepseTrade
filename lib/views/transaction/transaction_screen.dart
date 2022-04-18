import 'package:flutter/material.dart';
import 'package:frontend/config/constants.dart';
import 'package:frontend/controllers/transaction_controller.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/views/transaction/widgets/transaction_tile.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  final TransactionController transactionController =
      Get.find<TransactionController>();

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
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: transactionController.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction =
                          transactionController.transactions[index];
                      return TransactionTile(
                        name: transaction.stock.companyName,
                        price: transaction.price,
                        units: transaction.units,
                        type: transaction.type,
                        date: transaction.date,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
