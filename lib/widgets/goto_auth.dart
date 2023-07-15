import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

class GoToAuth extends StatelessWidget {
  final String label;
  final String buttonLabel;
  final Function() buttonOnPressed;

  const GoToAuth({
    Key? key,
    required this.label,
    required this.buttonLabel,
    required this.buttonOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: kAppGreyColor,
          ),
        ),
        TextButton(
          onPressed: buttonOnPressed,
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: kAppPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
