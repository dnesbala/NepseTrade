import 'dart:convert';

List<Stock> todaysPriceFromJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));

String todaysPriceToJson(List<Stock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stock {
  Stock({
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

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
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
