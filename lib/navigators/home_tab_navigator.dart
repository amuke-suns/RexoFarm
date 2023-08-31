import 'package:flutter/material.dart';
import 'package:rexofarm/navigators/tab_item.dart';
import 'package:rexofarm/screens/dashboard_page.dart';
import 'package:rexofarm/screens/profile/profile_page.dart';
import 'package:rexofarm/screens/shipments/shipment_page.dart';


class HomeTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  const HomeTabNavigator({
    super.key,
    required this.navigatorKey,
    required this.tabItem,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            switch(tabItem) {
              case TabItem.dashboard:
                return const DashboardPage();
              case TabItem.shipment:
                return const ShipmentPage();
              case TabItem.profile:
                return const ProfilePage();
            }
          },
        );
      },
    );
  }
}
