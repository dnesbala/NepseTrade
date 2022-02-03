import 'package:flutter/material.dart';
import 'package:frontend/widgets/label_text.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen({Key? key}) : super(key: key);

  final List portfolioData = [
    {
      "stock_name": "JBBL",
      "units": 100,
      "ltp": 450,
      "current_value": 45000,
      "investment": 40000,
      "overall_profit": 5000,
      "gain_percent": 30.5,
      "today_profit": 390,
      "targets": [480, 520, 550],
      "stop_loss": 420,
    },
    {
      "stock_name": "NABIL",
      "units": 500,
      "ltp": 1100,
      "current_value": 45000,
      "investment": 40000,
      "overall_profit": 5000,
      "gain_percent": 30.5,
      "today_profit": 390,
      "targets": [480, 520, 550],
      "stop_loss": 420,
    },
    {
      "stock_name": "HDL",
      "units": 50,
      "ltp": 4400,
      "current_value": 45000,
      "investment": 40000,
      "overall_profit": 5000,
      "gain_percent": 30.5,
      "today_profit": 390,
      "targets": [480, 520, 550],
      "stop_loss": 420,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    padding: const EdgeInsets.only(left: 8, top: 5),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * .2,
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("As of 2022/02/03",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black87)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text("Holdings",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: portfolioData.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = portfolioData[index];
                  return ExpansionTile(
                    title: Text(item["stock_name"]),
                    subtitle: Text("${item["units"]} units"),
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          color: Colors.grey.shade100,
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  LabelText(
                                      label: "LTP",
                                      value: item["ltp"].toString(),
                                      textColor: Colors.green),
                                  LabelText(
                                      label: "Current Value",
                                      value: item["current_value"].toString()),
                                  LabelText(
                                      label: "Investment",
                                      value: item["investment"].toString()),
                                ],
                              ),
                              TableRow(
                                children: [
                                  LabelText(
                                      label: "Overall P/L",
                                      value: item["overall_profit"].toString(),
                                      textColor: Colors.green),
                                  LabelText(
                                      label: "P/L %",
                                      value: item["gain_percent"].toString(),
                                      textColor: Colors.green),
                                  LabelText(
                                      label: "Today's P/L",
                                      value: item["today_profit"].toString(),
                                      textColor: Colors.green),
                                ],
                              ),
                              TableRow(
                                children: [
                                  LabelText(
                                      label: "Targets",
                                      value: item["targets"].toString()),
                                  LabelText(
                                      label: "Stop Loss",
                                      value: item["stop_loss"].toString()),
                                  SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                //             {
                //   "stock_name": "JBBL",
                //   "units": 100,
                //   "ltp": 450,
                //   "current_value": 45000,
                //   "investment": 40000,
                //   "overall_profit": 5000,
                //   "gain_percent": 30.5,
                //   "today_profit": 390,
                //   "targets": [480, 520, 550],
                //   "stop_loss": 420,
                // }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
