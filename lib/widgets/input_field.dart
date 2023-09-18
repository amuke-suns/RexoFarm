import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?) validator;
  final bool obscureText;
  final bool showToggle;
  final TextInputType? keyboardType;

  const InputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.showToggle = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscure = true;

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
          child: TextFormField(
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            obscureText: widget.obscureText && _isObscure,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: widget.hintText,
              suffixIcon: widget.showToggle
                  ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
