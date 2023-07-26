import 'package:flutter/material.dart';
import 'package:rexofarm/screens/home.dart';

class NavigationUtils {
  static goTo(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }

  static replacePage(BuildContext context, Widget destination) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => destination,
      ),
    );
  }

  static clearStackAndGoTo(BuildContext context, Widget destination) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => destination,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static clearStackAndHome(BuildContext context) {
    clearStackAndGoTo(context, const Home());
  }
}
