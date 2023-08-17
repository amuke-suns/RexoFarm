import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

class AppDropdownDialog extends StatefulWidget {
  final String description;
  final Function(String) onSelected;

  const AppDropdownDialog({
    Key? key,
    required this.description,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<AppDropdownDialog> createState() => _AppDropdownDialogState();
}

class _AppDropdownDialogState extends State<AppDropdownDialog> {

  late String _description;

  @override
  void initState() {
    _description = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(243, 244, 238, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _description,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
        onPressed: () async {
          String? selectedValue = await showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text(widget.description),
                children: kVehicleTypes
                    .map((e) => SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, e);
                          },
                          child: Text(e),
                        ))
                    .toList(),
              );
            },
          );
          if (selectedValue != null) {
            setState(() {
              _description = selectedValue;
            });
            widget.onSelected(selectedValue);
          }
        },
      ),
    );
  }
}
