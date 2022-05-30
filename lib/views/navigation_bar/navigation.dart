import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get.dart';
import 'package:nft_app/views/screens/more.dart';
import 'package:nft_app/views/screens/ntf_market.dart';
import 'package:nft_app/views/screens/setting.dart';

import '../screens/dashboard.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MaterialYou extends StatefulWidget {
  const MaterialYou({Key? key}) : super(key: key);

  @override
  State<MaterialYou> createState() => _MaterialYouState();
}

final List locale = [
  {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  {'name': 'Ø¹Ø±Ø¨Ù‰', 'locale': Locale('ar', 'SA')},
];

updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}

class _MaterialYouState extends State<MaterialYou> {
  int _currentIndex = 0;
  List<Widget> pages = [
    dashboard(),
    NTFMarket(),
    dashboard(),
    dashboard(),
   Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: Center(
          child: pages[_currentIndex],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            // indicatorColor: Colors.blue.shade200,
            //  backgroundColor: Colors.blue.shade500,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.dashboard),
                icon: Icon(Icons.dashboard_outlined),
                label: 'Dashboard',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'NFT Market',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.inventory),
                icon: Icon(Icons.inventory),
                label: ' My Inventory',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.money),
                icon: Icon(Icons.money_outlined),
                label: 'Withdraw',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.more_horiz),
                icon: Icon(Icons.more_horiz_outlined),
                label: 'More',
              ),
            ],
          ),
        ));
  }
}
