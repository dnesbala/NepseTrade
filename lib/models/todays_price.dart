import 'dart:convert';

List<TodaysPrice> todaysPriceFromJson(String str) => List<TodaysPrice>.from(
    json.decode(str).map((x) => TodaysPrice.fromJson(x)));

String todaysPriceToJson(List<TodaysPrice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodaysPrice {
  TodaysPrice({
    required this.companyName,
    required this.noOfTransactions,
    required this.maxPrice,
    required this.minPrice,
    required this.closingPrice,
    required this.tradedShares,
    required this.amount,
    required this.previousClosing,
    required this.difference,
  });

  String companyName;
  int noOfTransactions;
  double maxPrice;
  double minPrice;
  double closingPrice;
  int tradedShares;
  double amount;
  double previousClosing;
  double difference;

  factory TodaysPrice.fromJson(Map<String, dynamic> json) => TodaysPrice(
        companyName: json["companyName"],
        noOfTransactions: json["noOfTransactions"],
        maxPrice: json["maxPrice"].toDouble(),
        minPrice: json["minPrice"].toDouble(),
        closingPrice: json["closingPrice"].toDouble(),
        tradedShares: json["tradedShares"],
        amount: json["amount"].toDouble(),
        previousClosing: json["previousClosing"].toDouble(),
        difference: json["difference"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "noOfTransactions": noOfTransactions,
        "maxPrice": maxPrice,
        "minPrice": minPrice,
        "closingPrice": closingPrice,
        "tradedShares": tradedShares,
        "amount": amount,
        "previousClosing": previousClosing,
        "difference": difference,
      };
}
