import 'package:flutter/material.dart';
import 'package:frontend/controllers/stock/buy_stock_controller.dart';
import 'package:frontend/models/watchlist_model.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

buyStockModal(BuildContext context, Watchlist watchlist, double userBalance) {
  final buyStockController = Get.put<BuyStockController>(BuyStockController(),
      tag: UniqueKey().toString());

  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        var maxBuyUnits = (userBalance / watchlist.closingPrice).floor();
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 5),
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Buy ${watchlist.companyName}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white)),
                    Text("Max Buy Units: $maxBuyUnits",
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
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.only(
                            bottom: buyStockController.isUnitsFocused.value
                                ? MediaQuery.of(context).viewInsets.bottom * .5
                                : 0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Units"),
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    controller: buyStockController
                                        .unitsTextEditingController,
                                    focusNode:
                                        buyStockController.unitsFocusNode,
                                    onChanged: (String units) =>
                                        buyStockController
                                            .validateUnitsField(units),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: buyStockController
                                                      .isUnitsTextFieldValid
                                                      .value
                                                  ? Colors.grey
                                                  : Colors.red)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: buyStockController
                                                      .isUnitsTextFieldValid
                                                      .value
                                                  ? Colors.grey
                                                  : Colors.red)),
                                      isDense: true,
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Price"),
                                Text("Rs.${watchlist.closingPrice}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Total Amount : Rs.15000"),
                    SizedBox(height: 10),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.only(
                            bottom: buyStockController.isStopLossFocused.value
                                ? MediaQuery.of(context).viewInsets.bottom * .85
                                : 0),
                        child: Row(
                          children: [
                            Text("Stop Loss"),
                            Obx(
                              () => Switch(
                                value: buyStockController.hasStopLoss.value,
                                onChanged: (bool val) =>
                                    buyStockController.toggleStopLoss(val),
                                activeColor: Colors.green,
                              ),
                            ),
                            Spacer(),
                            Obx(
                              () {
                                if (buyStockController.hasStopLoss.value) {
                                  return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: TextField(
                                      controller: buyStockController
                                          .stopLossTextEditingController,
                                      focusNode:
                                          buyStockController.stopLossFocusNode,
                                      onChanged: (String sl) =>
                                          buyStockController
                                              .validateStopLossField(sl),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: buyStockController
                                                    .isStopLossFieldValid.value
                                                ? Colors.grey
                                                : Colors.red,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: buyStockController
                                                    .isStopLossFieldValid.value
                                                ? Colors.grey
                                                : Colors.red,
                                          ),
                                        ),
                                        isDense: true,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(10),
                  child: SlideAction(
                    outerColor: Colors.green,
                    height: 40,
                    sliderButtonIconSize: 14,
                    child: Text("Slide to Buy",
                        style: TextStyle(color: Colors.white)),
                    onSubmit: buyStockController.isUnitsTextFieldValid.value &&
                            buyStockController.isStopLossFieldValid.value
                        ? () => buyStockController.buyStock(watchlist)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
