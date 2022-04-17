import 'package:flutter/material.dart';
import 'package:frontend/config/app_links.dart';
import 'package:frontend/models/watchlist_model.dart';
import 'package:get/get.dart';

class WatchListTile extends StatelessWidget {
  final int index;
  final Watchlist watchlist;

  const WatchListTile({
    Key? key,
    required this.index,
    required this.watchlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.toNamed(AppLinks.STOCKDETAIL, arguments: watchlist),
          title: Text(watchlist.companyName,
              style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Row(
            children: [
              Text("Rs.${watchlist.closingPrice}",
                  style: Theme.of(context).textTheme.subtitle1),
              Text(" (${watchlist.difference})",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: watchlist.difference.isNegative
                            ? Colors.red
                            : Colors.green,
                      )),
            ],
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_right),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Center(
                  child: Text(
                    "${index + 1}",
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
