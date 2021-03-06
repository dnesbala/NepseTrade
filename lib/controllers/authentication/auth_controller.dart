import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/config/app_links.dart';
import 'package:frontend/config/constants.dart';
import 'package:frontend/models/user_model.dart' as model;
import 'package:frontend/utils/helpers.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  @override
  void onReady() {
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(AppLinks.AUTH);
    } else {
      Get.offAllNamed(AppLinks.HOME);
    }
  }

  void loginWithEmailPassword(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(
        title: "Error logging in",
        message: e.message!,
      );
    }
  }

  void registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      model.User user = model.User(
        email: email,
        balance: 100000,
        userId: credential.user!.uid,
      );
      await fireStore
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(
        title: "Error creating account",
        message: e.message!,
      );
    }
  }

  void logOut() async {
    await firebaseAuth.signOut();
  }
}
