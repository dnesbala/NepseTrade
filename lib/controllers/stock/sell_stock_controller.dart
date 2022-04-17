import 'package:flutter/cupertino.dart';
import 'package:frontend/controllers/transaction_controller.dart';
import 'package:frontend/models/watchlist_model.dart';
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

  sellStock(Watchlist watchlist) {
    TransactionController.instance.addTransaction(
      stock: watchlist,
      units: int.parse(unitsTextFieldController.text),
      price: watchlist.closingPrice,
      type: "Sell",
    );
    Get.back();
  }
}
