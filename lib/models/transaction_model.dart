import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/models/watchlist_model.dart';

class Transaction {
  final String transactionId;
  final String userId;
  final Watchlist stock;
  final int units;
  final double price;
  final double totalAmount;
  final String type;
  final double? stopLoss;

  Transaction({
    required this.transactionId,
    required this.userId,
    required this.stock,
    required this.units,
    required this.price,
    required this.totalAmount,
    required this.type,
    this.stopLoss,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'transactionId': transactionId,
      'stock': stock.toJson(),
      'units': units,
      'price': price,
      'totalAmount': totalAmount,
      'type': type,
      'stopLoss': stopLoss,
    };
  }

  static Transaction fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Transaction(
      transactionId: snapshot["transactionId"],
      userId: snapshot["userId"],
      stock: Watchlist.fromSnap(snapshot["stock"]),
      units: snapshot["units"],
      price: snapshot["price"],
      totalAmount: snapshot["totalAmount"],
      type: snapshot["type"],
      stopLoss: snapshot["stopLoss"] ?? 0,
    );
  }
}
