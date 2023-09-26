import 'package:flutter/material.dart';

class TextWithHeader extends StatelessWidget {
  final String header;
  final String? text;
  final Widget? bodyWidget;

  const TextWithHeader({
    super.key,
    required this.header,
    this.text,
    this.bodyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(fontSize: 11, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          bodyWidget ??
              Text(
                text!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
          const Divider(),
        ],
      ),
    );
  }
}