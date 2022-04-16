import 'package:get/get.dart';

String? validateEmail(String? email) {
  if (!GetUtils.isEmail(email!)) {
    return "Invalid Email";
  } else {
    return null;
  }
}
