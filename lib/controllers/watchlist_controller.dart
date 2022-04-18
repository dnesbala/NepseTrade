import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/config/constants.dart';
import 'package:frontend/models/stock_model.dart';
import 'package:frontend/models/watchlist_model.dart';
import 'package:get/get.dart';

class WatchlistController extends GetxController {
  final Rx<List<Watchlist>> _watchlists = Rx<List<Watchlist>>([]);
  List<Watchlist> get watchlists => _watchlists.value;

  @override
  void onInit() {
    _watchlists.bindStream(fireStore
        .collection("watchlist")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Watchlist> retVal = [];
      for (var element in query.docs) {
        var currentUserId = firebaseAuth.currentUser!.uid;
        if (currentUserId == Watchlist.fromSnap(element).userId) {
          retVal.add(Watchlist.fromSnap(element));
        }
      }
      return retVal;
    }));
    super.onInit();
  }

  addToWatchlist(Stock stock) async {
    try {
      var allDocs = await fireStore.collection("watchlist").get();
      int len = allDocs.docs.length;

      Watchlist watchlist = Watchlist(
        userId: firebaseAuth.currentUser!.uid,
        watchlistId: "Watchlist $len",
        companyName: stock.companyName,
        noOfTransactions: stock.noOfTransactions,
        amount: stock.amount,
        tradedShares: stock.tradedShares,
        minPrice: stock.minPrice,
        maxPrice: stock.maxPrice,
        closingPrice: stock.closingPrice,
        previousClosing: stock.previousClosing,
        difference: stock.difference,
      );

      await fireStore
          .collection("watchlist")
          .doc("Watchlist $len")
          .set(watchlist.toJson());
    } catch (e) {
      print(e);
    }
  }
}
