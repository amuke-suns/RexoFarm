import 'package:flutter/material.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/validators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../dashboard/dashboard.dart';
import 'next_of_kin.dart';

class DriverAddressScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController homeAddressController = TextEditingController();

  DriverAddressScreen({Key? key}) : super(key: key);

    final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 68, left: 0, right: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: const Text(
                  'Update Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 8,
                width: 46,
                margin: const EdgeInsets.only(left: 150, top: 8, right: 150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: SmoothPageIndicator(
                    count: 2,
                    controller: _controller,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 8,
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xFF006E21),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Driver\'s Address',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1.071,
                  letterSpacing: 0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputField(
                        labelText: 'State of Residence',
                        controller: stateController,
                        validator: Validators.validateState,
                        hintText: 'Enter your state of residence',
                      ),
                    
            const SizedBox(height: 16),
            InputField(
              labelText: 'City',
              controller: cityController,
              validator: Validators.validateCity,
              hintText: 'Enter your city',
            ),
            const SizedBox(height: 16),
            InputField(
              labelText: 'Home Address',
              controller: homeAddressController,
              validator: Validators.validateHomeAddress,
              hintText: 'Enter your home address',
            ),
            ],
           ),
          ),
              ),
            ),
            const SizedBox(height: 201),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                     context,
                     MaterialPageRoute(
                      builder: (
                        context) => NextOfKinScreen()),
                   );
                  // Add your logic here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 19),
                  backgroundColor: const Color.fromRGBO(0, 110, 33, 1),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 110, 33, 1),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
