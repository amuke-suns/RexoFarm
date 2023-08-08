import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

enum AlertType {
  success,
  error,
}

mixin AlertUtils {
  Future<bool> showConfirmationDialog(BuildContext context) async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want to exit the app?'),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }

  showInfoSnackBar(
    BuildContext context, {
    required String description,
    required AlertType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        backgroundColor:
            type == AlertType.success ? kAppSecondaryColor : Colors.redAccent.shade100,
        content: ListTile(
          leading: type == AlertType.success ? kSuccessIcon : kErrorIcon,
          title: Text(description),
        ),
      ),
    );
  }

  showLoadingAlert(BuildContext context, {required String text}) {
    Dialog alert = Dialog(
      backgroundColor: kAppSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 7),
              child: Text(
                "$text...",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(
      useSafeArea: true,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showMessageAlert(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    AlertDialog alert = AlertDialog(
      backgroundColor: kAppSecondaryColor,
      title: Text(
        title,
      ),
      content: Text(
        body,
      ),
      actions: [
        TextButton(
            child: const Text(
              'OK',
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );

    showDialog(
      barrierColor: Colors.black26,
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void dismissLoader(BuildContext context, {bool rootNavigator = false}) {
    Navigator.of(context, rootNavigator: rootNavigator).pop();
  }
}
