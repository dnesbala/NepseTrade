import 'package:flutter/material.dart';

class WatchListTile extends StatelessWidget {
  final String symbol;
  final String name;
  final double ltp;
  final double change;
  final double changePercent;

  const WatchListTile({
    Key? key,
    required this.symbol,
    required this.name,
    required this.ltp,
    required this.change,
    required this.changePercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(symbol),
          subtitle: Text(name, style: Theme.of(context).textTheme.subtitle2),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("Rs.$ltp", style: Theme.of(context).textTheme.subtitle1),
              Text("+$change ($changePercent)",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.green)),
            ],
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Center(
                  child: Text(
                    1.toString(),
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                radius: 15,
              ),
            ],
          ),
          minLeadingWidth: 0,
        ),
        Divider(height: 0),
      ],
    );
  }
}
