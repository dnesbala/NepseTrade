import 'package:flutter/material.dart';

class StockDetailScreen extends StatelessWidget {
  const StockDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mega Bank Limited", overflow: TextOverflow.ellipsis),
            Text("MEGA",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white)),
          ],
        ),
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
          Text("Stats", style: Theme.of(context).textTheme.headline6),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Buy"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
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
}
