import 'package:flutter/material.dart';
import 'package:rexofarm/inputs/input_field.dart';
import 'package:rexofarm/validators.dart';
import '../inputs/phoneinput.dart';

class FirstCreateAccountPage extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final VoidCallback onNextPressed;

  const FirstCreateAccountPage({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          labelText: 'First Name',
          controller: firstNameController,
          validator: Validators.validateFirstName,
          placeholderText: 'John',
        ),
        const SizedBox(height: 29),
        InputField(
          labelText: 'Last Name',
          controller: lastNameController,
          validator: Validators.validateLastName,
          placeholderText: 'Doe',
        ),
        const SizedBox(height: 29),
        PhoneInput(
          controller: phoneNumberController,
          onPhoneNumberChanged: (phone) {
            // Handle phone number changes if needed
          },
        ),
        const SizedBox(height: 64),
        Container(
          height: 53,
          width: 358,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: ElevatedButton(
            onPressed: onNextPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.fromLTRB(40, 19, 40, 19),
              backgroundColor: const Color.fromRGBO(0, 110, 33, 1),
            ),
            child: const Text(
              'Next',
               style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF),
              ),
              ),
          ),
        ),
        const SizedBox(height: 50),
        Center(
          child: GestureDetector(
            onTap: () {
              // Handle "Third party signup" link click
            },
            child: const Text(
              'Third party sign up',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF767873),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
