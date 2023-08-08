import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/screens/home.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';

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
    // this method is called during the KYC uploading
    // which is after a successful login
    // that is, the userToken will be set in the AuthViewModel already
    String token = Provider.of<AuthViewModel>(
      context,
      listen: false,
    ).userToken!;

    clearStackAndGoTo(context, Home(token: token));
  }
}
