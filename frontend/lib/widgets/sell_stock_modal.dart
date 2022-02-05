import 'package:flutter/material.dart';
import 'package:frontend/controllers/stock/sell_stock_controller.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

sellStockModal(BuildContext context) {
  final sellStockController = Get.put<SellStockController>(
      SellStockController(),
      tag: UniqueKey().toString());

  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 5),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sell MEGA",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white)),
                  Text("Total units: 150",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom * .75),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Units"),
                            SizedBox(
                              width: 100,
                              child: Obx(
                                () => TextField(
                                  controller: sellStockController
                                      .unitsTextFieldController,
                                  onChanged: (String units) =>
                                      sellStockController
                                          .validateUnitsField(units),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: sellStockController
                                                  .isUnitsFieldValid.value
                                              ? Colors.grey
                                              : Colors.red),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: sellStockController
                                                  .isUnitsFieldValid.value
                                              ? Colors.grey
                                              : Colors.red),
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Price"),
                            Text("Rs.297"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Total Amount : Rs.15000"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SlideAction(
                outerColor: Colors.red,
                height: 40,
                sliderButtonIconSize: 14,
                child: Text("Slide to Sell",
                    style: TextStyle(color: Colors.white)),
                onSubmit: sellStockController.isUnitsFieldValid.value
                    ? sellStockController.sellStock
                    : null,
              ),
            ),
          ],
        );
      });
}
