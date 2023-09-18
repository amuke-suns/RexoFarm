import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

class MainPageButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const MainPageButton({
    Key? key,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.fromLTRB(40, 19, 40, 19),
          backgroundColor: kAppPrimaryColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}