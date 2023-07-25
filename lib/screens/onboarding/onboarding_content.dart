import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rexofarm/utilities/constants.dart';

class OnBoardingContent extends StatelessWidget {
  final String fileName;
  final String title;
  final String subtitle;
  final String coloredTitle;

  const OnBoardingContent({
    Key? key,
    required this.fileName,
    required this.title,
    required this.subtitle,
    this.coloredTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'images/onboarding/$fileName',
          ),
          RichText(
            text: TextSpan(
              text: title,
              style: DefaultTextStyle.of(context).style.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: coloredTitle,
                  style: const TextStyle(color: kAppPrimaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
