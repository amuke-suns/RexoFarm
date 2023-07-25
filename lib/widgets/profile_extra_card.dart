import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileExtraCard extends StatelessWidget {
  final Widget widgetTitle;
  final String description;

  const ProfileExtraCard({
    Key? key,
    required this.widgetTitle,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFFF5FEFF),
        border: Border.all(
          width: 0.7,
          color: const Color(0xFFBCEBF1),
        ),
      ),
      child: Column(
        children: [
          widgetTitle,
          AutoSizeText(
            description,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
