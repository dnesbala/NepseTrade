import 'package:frontend/config/constants.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/watchlist_model.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  static TransactionController instance = Get.find();

  Rx<List<Transaction>> _transactions = Rx<List<Transaction>>([]);
  List<Transaction> get transactions => _transactions.value;

  @override
  void onInit() {
    _transactions.bindStream(
        fireStore.collection("transactions").snapshots().map((query) {
      List<Transaction> retVal = [];
      for (var element in query.docs) {
        var currentUserId = firebaseAuth.currentUser!.uid;
        if (currentUserId == Transaction.fromSnap(element).userId) {
          retVal.add(Transaction.fromSnap(element));
        }
      }
      return retVal;
    }));
    super.onInit();
  }

  void addTransaction({
    required Watchlist stock,
    required int units,
    required double price,
    required String type,
    double? stopLoss,
  }) async {
    try {
      var userId = firebaseAuth.currentUser!.uid;
      var allDocs = await fireStore.collection("transactions").get();
      int len = allDocs.docs.length;

      Transaction transaction = Transaction(
        stock: stock,
        transactionId: "Transaction $len",
        userId: userId,
        units: units,
        price: price,
        totalAmount: units * price,
        date: DateTime.now(),
        type: type,
        stopLoss: stopLoss,
      );

      await fireStore
          .collection("transactions")
          .doc("Transaction $len")
          .set(transaction.toJson());

      var userDoc = await fireStore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      await fireStore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        "balance": type == "Buy"
            ? userDoc.data()!["balance"] - (units * price)
            : userDoc.data()!["balance"] + (units * price),
      });
    } catch (e) {
      print(e);
    }
  }
}
