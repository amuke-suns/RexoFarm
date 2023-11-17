import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/widgets/shimmer_widget.dart';

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

  Future<bool> showCancelDialog(
    BuildContext context, {
    required String title,
    required String description,
  }) async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color(0xFFDE3730),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(title),
            ),
          ],
        );
      },
    );
    return shouldPop ?? false;
  }

  showInfoSnackBar(
    BuildContext context, {
    required String description,
    required AlertType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        backgroundColor: type == AlertType.success
            ? kAppSecondaryColor
            : Colors.redAccent.shade100,
        content: ListTile(
          leading: type == AlertType.success ? kSuccessIcon : kErrorIcon,
          title: Text(description),
        ),
      ),
    );
  }

  showSuccessSnackBar(
    BuildContext context, {
    required String title,
    String? categories,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: kAppPrimaryColor),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFD4FFCE),
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: kAppPrimaryColor,
            ),
            const SizedBox(width: 10),
            Text.rich(TextSpan(
              text: title,
              style: DefaultTextStyle.of(context).style.apply(
                    color: Colors.black,
                    fontWeightDelta: 2,
                  ),
              children: [
                categories == null
                    ? const TextSpan()
                    : TextSpan(
                        text: ' deleted from $categories.',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      )
              ],
            )),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 200,
          left: 10,
          right: 10,
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
              Navigator.of(context, rootNavigator: true).pop();
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
