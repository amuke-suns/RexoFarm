import 'package:flutter/material.dart';
import 'package:rexofarm/widgets/text_with_header.dart';

class DoubleTextsWithHeaders extends StatelessWidget {
  final String firstHeader;
  final String firstText;
  final String secondHeader;
  final String secondText;

  const DoubleTextsWithHeaders({
    Key? key,
    required this.firstHeader,
    required this.firstText,
    required this.secondHeader,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextWithHeader(
            header: firstHeader,
            text: firstText,
          ),
        ),
        Expanded(
          child: TextWithHeader(
            header: secondHeader,
            text: secondText,
          ),
        ),
      ],
    );
  }
}