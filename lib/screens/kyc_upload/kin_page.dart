import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/inputs/phoneinput.dart';
import 'package:rexofarm/validators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home.dart';
import 'kin_address_page.dart';

class NextOfKinPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  NextOfKinPage({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  'Upload Vehicle',
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
                  'Next of Kin',
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
              const SizedBox(height: 43),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InputField(
                      labelText: 'First Name',
                      controller: firstNameController,
                      validator: Validators.validateName,
                      hintText: 'Enter your first name',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InputField(
                      labelText: 'Last Name',
                      controller: lastNameController,
                      validator: Validators.validateName,
                      hintText: 'Enter your last name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              InputField(
                labelText: 'Gender',
                controller: genderController,
                validator: Validators.validateGender,
                hintText: 'Choose your Gender',
              ),
              const SizedBox(height: 16),
              InputField(
                labelText: 'Relationship',
                controller: relationshipController,
                validator: Validators.validateRelationship,
                hintText: 'Choose your relationship',
              ),
              const SizedBox(height: 16),
              PhoneInput(
                controller: phoneNumberController,
                onPhoneNumberChanged: (phone) {},
              ),
              const SizedBox(height: 140),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    NavigationUtils.goTo(context, NextOfKinAddressPage());
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
                    NavigationUtils.clearStackAndHome(context);
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
      ),
    );
  }
}
