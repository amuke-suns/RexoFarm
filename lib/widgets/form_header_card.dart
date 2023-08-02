import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FormHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int pageIndicatorCount;
  final int totalIndicators;
  final PageController _controller;

  FormHeaderCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.pageIndicatorCount,
    this.totalIndicators = 2, // default to 2
  })  : _controller = PageController(initialPage: pageIndicatorCount),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 1.25,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        SmoothPageIndicator(
          count: totalIndicators,
          controller: _controller,
          axisDirection: Axis.horizontal,
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 8,
            dotColor: Colors.grey,
            activeDotColor: Color(0xFF006E21),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          subtitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1.071,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
