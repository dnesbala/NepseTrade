import 'package:flutter/cupertino.dart';
import 'package:frontend/controllers/transaction_controller.dart';
import 'package:frontend/models/watchlist_model.dart';
import 'package:get/get.dart';

class BuyStockController extends GetxController {
  late TextEditingController unitsTextEditingController,
      stopLossTextEditingController;
  late FocusNode unitsFocusNode, stopLossFocusNode;
  var hasStopLoss = false.obs;
  var isUnitsFocused = false.obs;
  var isStopLossFocused = false.obs;
  var isUnitsTextFieldValid = false.obs;
  var isStopLossFieldValid = true.obs;

  @override
  void onInit() {
    unitsTextEditingController = TextEditingController();
    stopLossTextEditingController = TextEditingController();
    unitsFocusNode = FocusNode();
    stopLossFocusNode = FocusNode();
    unitsFocusNode.addListener(() {
      isUnitsFocused.value = unitsFocusNode.hasFocus;
    });

    stopLossFocusNode.addListener(() {
      isStopLossFocused.value = stopLossFocusNode.hasFocus;
    });
    super.onInit();
  }

  @override
  void onClose() {
    unitsTextEditingController.dispose();
    stopLossTextEditingController.dispose();
    unitsFocusNode.dispose();
    stopLossFocusNode.dispose();
    super.onClose();
  }

  toggleStopLoss(bool value) {
    hasStopLoss.value = value;
    if (!hasStopLoss.value) {
      isStopLossFocused.value = false;
      isStopLossFieldValid.value = true;
    } else {
      unitsFocusNode.unfocus();
      if (stopLossTextEditingController.text.isEmpty) {
        isStopLossFieldValid.value = false;
      }
    }
  }

  void validateUnitsField(String units) {
    if (units.isEmpty) {
      isUnitsTextFieldValid.value = false;
    } else {
      isUnitsTextFieldValid.value = true;
    }
  }

  void validateStopLossField(String sl) {
    if (hasStopLoss.value && sl.isEmpty) {
      isStopLossFieldValid.value = false;
    } else {
      isStopLossFieldValid.value = true;
    }
  }

  buyStock(Watchlist watchlist) async {
    TransactionController.instance.addTransaction(
      stock: watchlist,
      units: int.parse(unitsTextEditingController.text),
      price: watchlist.closingPrice,
      type: "Buy",
    );

    unitsTextEditingController.clear();
    stopLossTextEditingController.clear();
    Get.back();
  }
}
