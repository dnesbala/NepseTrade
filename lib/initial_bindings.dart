import 'package:frontend/controllers/authentication/auth_controller.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthPageController());
    Get.lazyPut(() => AuthController());
  }
}
