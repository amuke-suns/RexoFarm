import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rexofarm/layouts/home_icons_icons.dart';
import 'package:rexofarm/utilities/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GNav(
        selectedIndex: currentIndex,
        gap: 8,
        activeColor: kAppPrimaryColor,
        tabBackgroundColor: const Color(0xFFF6FFF0),
        padding: const EdgeInsets.all(16),
        onTabChange: onTap,
        tabs: const [
          GButton(
            icon: HomeIcons.home,
            text: 'Dashboard',
          ),
          GButton(
            icon: HomeIcons.shipment,
            text: 'Shipment',
          ),
          GButton(
            icon: HomeIcons.user,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
