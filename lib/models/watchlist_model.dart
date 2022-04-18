import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Watchlist {
  final String watchlistId;
  final String userId;
  final String companyName;
  final int noOfTransactions;
  final double maxPrice;
  final double minPrice;
  final double closingPrice;
  final int tradedShares;
  final double amount;
  final double previousClosing;
  final double difference;

  Watchlist({
    required this.watchlistId,
    required this.userId,
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

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'watchlistId': watchlistId,
        'companyName': companyName,
        'noOfTransactions': noOfTransactions,
        'maxPrice': maxPrice,
        'minPrice': minPrice,
        'closingPrice': closingPrice,
        'tradedShares': tradedShares,
        'amount': amount,
        'previousClosing': previousClosing,
        'difference': difference,
      };

  static Watchlist fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Watchlist(
      userId: snapshot["userId"],
      watchlistId: snapshot["watchlistId"],
      companyName: snapshot["companyName"],
      noOfTransactions: snapshot["noOfTransactions"],
      maxPrice: snapshot["maxPrice"],
      minPrice: snapshot["minPrice"],
      closingPrice: snapshot["closingPrice"],
      tradedShares: snapshot["tradedShares"],
      amount: snapshot["amount"],
      previousClosing: snapshot["previousClosing"],
      difference: snapshot["difference"],
    );
  }

  factory Watchlist.fromMap(Map<String, dynamic> map) {
    return Watchlist(
      watchlistId: map['watchlistId'] ?? '',
      userId: map['userId'] ?? '',
      companyName: map['companyName'] ?? '',
      noOfTransactions: map['noOfTransactions']?.toInt() ?? 0,
      maxPrice: map['maxPrice']?.toDouble() ?? 0.0,
      minPrice: map['minPrice']?.toDouble() ?? 0.0,
      closingPrice: map['closingPrice']?.toDouble() ?? 0.0,
      tradedShares: map['tradedShares']?.toInt() ?? 0,
      amount: map['amount']?.toDouble() ?? 0.0,
      previousClosing: map['previousClosing']?.toDouble() ?? 0.0,
      difference: map['difference']?.toDouble() ?? 0.0,
    );
  }
}
