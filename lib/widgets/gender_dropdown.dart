import 'package:flutter/material.dart';

enum Gender { Male, Female, Other }

class GenderDropdown extends StatefulWidget {
  final String labelText;
  final Function(Gender?)? onChanged;
  final Gender? value;
  final String? hintText;

  const GenderDropdown({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.value,
    this.hintText,
  }) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            color: Color.fromRGBO(26, 28, 25, 1),
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
          child: DropdownButtonFormField<Gender>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            items: const [
              DropdownMenuItem<Gender>(
                value: Gender.Male,
                child: Text('Male'),
              ),
              DropdownMenuItem<Gender>(
                value: Gender.Female,
                child: Text('Female'),
              ),
              DropdownMenuItem<Gender>(
                value: Gender.Other,
                child: Text('Other'),
              ),
            ],
            onChanged: widget.onChanged,
            value: widget.value,
          ),
        ),
      ],
    );
  }
}
