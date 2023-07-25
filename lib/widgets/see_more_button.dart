import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SeeMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: 122,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xff006E21),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: const Text(
          'See more',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 1.2857142857142858,
            color: Color(0xff006E21),
          ),
        ),
      ),
    );
  }
}
