import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/navigators/app_navigator.dart';
import 'package:rexofarm/navigators/tab_item.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabItem _currentTab = TabItem.dashboard;

  final _navigatorKeys = {
    TabItem.dashboard: GlobalKey<NavigatorState>(),
    TabItem.shipment: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void onTabTapped(int index) {
    setState(() {
      _currentTab = TabItem.values[index];
    });
  }

  @override
  void initState() {
    Provider.of<AuthViewModel>(context, listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            _buildOffstageNavigator(TabItem.dashboard),
            _buildOffstageNavigator(TabItem.shipment),
            _buildOffstageNavigator(TabItem.profile),
          ]),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentTab.index,
          onTap: onTabTapped,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: AppNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
