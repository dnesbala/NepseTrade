import 'package:flutter/cupertino.dart';
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

  buyStock() {
    print("Stock bought");
    print(unitsTextEditingController.text);
    print(stopLossTextEditingController.text);
    unitsTextEditingController.clear();
    stopLossTextEditingController.clear();
    Get.back();
  }
}
