import 'package:get/get.dart';

class PasswordTextFieldController extends GetxController {
  var isPasswordShown = false.obs;

  void toggle() {
    isPasswordShown.value = !isPasswordShown.value;
  }
}
