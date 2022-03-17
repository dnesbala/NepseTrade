import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SellStockController extends GetxController {
  late TextEditingController unitsTextFieldController;
  var isUnitsFieldValid = false.obs;

  @override
  void onInit() {
    unitsTextFieldController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    unitsTextFieldController.dispose();
    super.onClose();
  }

  validateUnitsField(String units) {
    if (units.isNotEmpty) {
      isUnitsFieldValid.value = true;
    } else {
      isUnitsFieldValid.value = false;
    }
  }

  sellStock() {
    print(unitsTextFieldController.text);
    print("Stock sold");
    Get.back();
  }
}
