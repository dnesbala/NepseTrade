import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/views/more/more_screen.dart';
import 'package:frontend/views/portfolio/portfolio_screen.dart';
import 'package:frontend/views/tools/tools_screen.dart';
import 'package:frontend/views/transaction/transaction_screen.dart';
import 'package:frontend/views/watchlist/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.list),
      label: "Watchlist",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.moneyBill),
      label: "Transactions",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.chartPie),
      label: "Portfolio",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.tools),
      label: "Tools",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.gripHorizontal),
      label: "More",
    ),
  ];

  final pages = [
    WatchlistScreen(),
    TransactionScreen(),
    PortfolioScreen(),
    ToolsScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: bottomNavigationBarItems,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          selectedFontSize: 12,
        ),
      ),
    );
  }
}
