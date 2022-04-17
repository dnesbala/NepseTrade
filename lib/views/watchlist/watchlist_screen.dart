import 'package:flutter/material.dart';
import 'package:frontend/views/watchlist/widgets/watchlist_tile.dart';
import 'package:frontend/widgets/search_stock_delegate.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Watchlist",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => showSearch(
                context: context,
                delegate: SearchStockDelegate(),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: size.height * .06,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Search Stock.."),
                    SizedBox(width: 5),
                    Icon(Icons.search, size: 22),
                  ],
                ),
              ),
            ),
            WatchListTile(
                symbol: "MEGA",
                name: "Mega Bank Limited",
                ltp: 297,
                change: 3.5,
                changePercent: 1.2),
            WatchListTile(
                symbol: "MEGA",
                name: "Mega Bank Limited",
                ltp: 297,
                change: 3.5,
                changePercent: 1.2),
            WatchListTile(
                symbol: "MEGA",
                name: "Mega Bank Limited",
                ltp: 297,
                change: 3.5,
                changePercent: 1.2),
          ],
        ),
      ),
    );
  }
}
