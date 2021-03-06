import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthPageController>(() => AuthPageController());
  }
}
