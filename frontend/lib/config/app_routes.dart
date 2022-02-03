import 'package:frontend/config/app_links.dart';
import 'package:frontend/views/authentication/authentication_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: AppLinks.HOME, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.AUTH, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.PORTFOLIO, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.WATCHLIST, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.TRANSACTION, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.PROFILE, page: () => AuthenticationScreen()),
  ];
}
