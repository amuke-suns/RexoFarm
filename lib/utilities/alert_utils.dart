import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

mixin AlertUtils {
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

  showMessageAlert(BuildContext context,
      {required String title, required String body}) {
    AlertDialog alert = AlertDialog(
      // backgroundColor: kPrimaryColor1,
      title: Text(
        title,
        // style: kWhiteTextStyle,
      ),
      content: Text(
        body,
        // style: kWhiteTextStyle,
      ),
      actions: [
        TextButton(
            child: const Text(
              'OK',
              // style: kWhiteTextStyle,
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

  void dismissLoader(BuildContext context) => Navigator.pop(context);
}