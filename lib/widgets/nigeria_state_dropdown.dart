import 'package:flutter/material.dart';
import 'package:rexofarm/view_models/nigeria_states.dart';

class NigeriaStateDropdown extends StatefulWidget {
  final String labelText;
  final Function(NigeriaState?)? onChanged;
  final NigeriaState? value;
  final String? hintText; // New parameter for hint text

  const NigeriaStateDropdown({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.value,
    this.hintText, // Initialize hint text
  }) : super(key: key);

  @override
  _NigeriaStateDropdownState createState() => _NigeriaStateDropdownState();
}

class _NigeriaStateDropdownState extends State<NigeriaStateDropdown> {


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
          child: DropdownButtonFormField<NigeriaState>(
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
              // Use the provided hint text
            ),
            items: statesInNigeria.map((state) {
              return DropdownMenuItem<NigeriaState>(
                value: state,
                child: Text(state.name),
              );
            }).toList(),
            onChanged: widget.onChanged,
            value: widget.value,
          ),
        ),
      ],
    );
  }
}