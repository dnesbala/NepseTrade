import 'package:get/get.dart';

class AuthPageController extends GetxController {
  static AuthPageController instance = Get.find();

  var isLoginPage = true.obs;

  void selectLoginPage() {
    isLoginPage.value = true;
  }

  void selectRegisterPage() {
    isLoginPage.value = false;
  }
}
