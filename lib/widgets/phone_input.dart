import 'package:flutter/material.dart';

class PhoneInput extends StatefulWidget {
  final TextEditingController controller = TextEditingController(text: '');
  final void Function(String) onPhoneNumberChanged;

  PhoneInput({
    Key? key,
    required this.onPhoneNumberChanged,
  }) : super(key: key);

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  // Default country code, change as per your requirement
  String selectedCountryCode = '+234';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(
            color: Color.fromRGBO(26, 28, 25, 1),
            fontFamily: 'Quicksand',
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(243, 244, 238, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton<String>(
                  value: selectedCountryCode,
                  onChanged: (value) {
                    setState(() {
                      selectedCountryCode = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: '+234', // Nigeria
                      child: Text('+234'),
                    ),
                    DropdownMenuItem(
                      value: '+1', // United States
                      child: Text('+1'),
                    ),
                    DropdownMenuItem(
                      value: '+44', // United Kingdom
                      child: Text('+44'),
                    ),
                    DropdownMenuItem(
                      value: '+61', // Australia
                      child: Text('+61'),
                    ),
                    DropdownMenuItem(
                      value: '+33', // France
                      child: Text('+33'),
                    ),
                    DropdownMenuItem(
                      value: '+49', // Germany
                      child: Text('+49'),
                    ),
                    DropdownMenuItem(
                      value: '+91', // India
                      child: Text('+91'),
                    ),
                    DropdownMenuItem(
                      value: '+81', // Japan
                      child: Text('+81'),
                    ),
                    DropdownMenuItem(
                      value: '+86', // China
                      child: Text('+86'),
                    ),
                    // Add more countries and corresponding country codes here
                  ],
                ),
              ),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  onChanged: (value) {
                    final formattedPhoneNumber = '$selectedCountryCode$value';
                    widget.onPhoneNumberChanged(formattedPhoneNumber);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
