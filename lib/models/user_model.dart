import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? userId;
  final String? name;
  final String email;
  final int balance;

  User({
    this.userId,
    this.name,
    required this.email,
    required this.balance,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'email': email,
        'balance': balance,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      userId: snapshot["userId"],
      email: snapshot["email"],
      balance: snapshot["balance"],
      name: snapshot["name"] ?? "",
    );
  }
}
