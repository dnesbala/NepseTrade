import 'package:frontend/bindings/authentication_binding.dart';
import 'package:frontend/config/app_links.dart';
import 'package:frontend/views/authentication/authentication_screen.dart';
import 'package:frontend/views/home_screen.dart';
import 'package:frontend/views/portfolio/portfolio_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: AppLinks.FIRST, page: () => AuthenticationScreen()),
    GetPage(
        name: AppLinks.AUTH,
        page: () => AuthenticationScreen(),
        binding: AuthenticationBinding()),
    GetPage(name: AppLinks.HOME, page: () => HomeScreen()),
    GetPage(name: AppLinks.PORTFOLIO, page: () => PortfolioScreen()),
    GetPage(name: AppLinks.WATCHLIST, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.TRANSACTION, page: () => AuthenticationScreen()),
    GetPage(name: AppLinks.PROFILE, page: () => AuthenticationScreen()),
  ];
}
