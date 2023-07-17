import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../create_account/create_acct.dart';
import '../services/storage/storage_service.dart';
import 'onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.1, 0.5, 0.7, 1.0],
          colors: [
            Colors.white,
            Colors.green.shade100,
            Colors.white,
            Colors.green.shade200,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    foregroundColor: Colors.black,
                    backgroundColor: kAppSecondaryColor,
                    child: Text(
                      'Rexo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _goToCreateAccountPage(context),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: kAppPrimaryColor,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: const [
                    OnBoardingContent(
                      fileName: 'image_one.svg',
                      title: 'Shipments For You',
                      subtitle: 'Delivery shipments are assigned to you'
                          ' in accordance with your vehicle specifications.',
                    ),
                    OnBoardingContent(
                      fileName: 'image_two.svg',
                      title: 'Shipment completion = ',
                      coloredTitle: 'Payment',
                      subtitle: 'Payment for assigned shipments upon completion'
                          ' is deposited into your wallet.',
                    ),
                    OnBoardingContent(
                      fileName: 'image_three.svg',
                      title: 'Seamless Withdrawal',
                      subtitle: 'Withdraw money from your Rexofarm wallet '
                          'into your preferred bank account easily and seamlessly.',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 8,
                        spacing: 8,
                        dotColor: Colors.grey,
                        activeDotColor: kAppPrimaryColor,
                      ),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kAppPrimaryColor,
                        shape: const StadiumBorder(),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_forward_outlined),
                            Text('Get Started')
                          ],
                        ),
                      ),
                      onPressed: () => _goToCreateAccountPage(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToCreateAccountPage(BuildContext context) {
    StorageServiceImpl().setShowOnBoarding(false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const CreateAccountPage(),
      ),
    );
  }
}
