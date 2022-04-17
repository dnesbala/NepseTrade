import 'package:frontend/config/constants.dart';
import 'package:frontend/models/todays_price.dart';
import 'package:get/get.dart';

class StockApiServices extends GetConnect {
  Future<List<TodaysPrice>?> getTodaysPrices() async {
    try {
      final response = await get(TODAYS_PRICE_API_URL);
      var todaysPrices = todaysPriceFromJson(response.bodyString!);
      return todaysPrices;
    } catch (e) {
      print(e);
    }
  }
}
