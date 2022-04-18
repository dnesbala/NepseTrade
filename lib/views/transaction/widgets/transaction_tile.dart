import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/config/app_links.dart';
import 'package:get/get.dart';

class TransactionTile extends StatelessWidget {
  final String name;
  final DateTime date;
  final String type;
  final int units;
  final double price;

  const TransactionTile({
    Key? key,
    required this.name,
    required this.date,
    required this.type,
    required this.units,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.toNamed(AppLinks.STOCKDETAIL),
          title: Text(name),
          subtitle: Text("${date.year}/${date.month}/${date.day}",
              style: Theme.of(context).textTheme.subtitle2),
          trailing: SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(type, style: Theme.of(context).textTheme.subtitle1),
                Text("$units@Rs.$price",
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.moneyBillWaveAlt,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  size: 18),
            ],
          ),
          minLeadingWidth: 0,
        ),
        Divider(height: 0),
      ],
    );
  }
}
