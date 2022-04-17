import 'package:get/get.dart';

import 'package:frontend/models/todays_price.dart';
import 'package:frontend/services/stock_api_services.dart';

class StockController extends GetxController {
  StockApiServices stockApiServices;

  StockController({required this.stockApiServices});

  List<TodaysPrice>? stocks = <TodaysPrice>[].obs;

  @override
  void onInit() async {
    stocks = await stockApiServices.getTodaysPrices();
    print(stocks);
    super.onInit();
  }
}
