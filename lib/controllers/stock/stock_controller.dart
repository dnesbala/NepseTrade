import 'package:get/get.dart';

import 'package:frontend/models/stock_model.dart';
import 'package:frontend/services/stock_api_services.dart';

class StockController extends GetxController {
  StockApiServices stockApiServices;

  StockController({required this.stockApiServices});

  Rx<List<Stock>?> _stocks = Rx<List<Stock>>([]);
  List<Stock>? get stocks => _stocks.value;

  @override
  void onInit() {
    fetchStockTodayPrices();
    super.onInit();
  }

  void fetchStockTodayPrices() async {
    _stocks.value = await stockApiServices.getTodaysPrices();
  }
}
