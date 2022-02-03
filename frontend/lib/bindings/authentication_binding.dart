import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/controllers/authentication/auth_validation_controller.dart';
import 'package:frontend/controllers/password_textfield_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthPageController>(() => AuthPageController());
    Get.put<PasswordTextFieldController>(PasswordTextFieldController());
    Get.put<AuthValidationController>(AuthValidationController());
  }
}
