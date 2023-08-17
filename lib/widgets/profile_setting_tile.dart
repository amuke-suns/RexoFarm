import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';

class ProfileSettingTile extends StatelessWidget {
  final String fileName;
  final String title;
  final String? subtitle;
  final Color? color;
  final Function() onPressed;

  const ProfileSettingTile({
    Key? key,
    required this.fileName,
    required this.title,
    this.subtitle,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.all(0.0),
      leading: Image.asset('images/profile/$fileName'),
      title: Text(
        title,
        style: TextStyle(color: color ?? kAppPrimaryColor),
      ),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: const Icon(
        Icons.navigate_next,
        size: 30,
      ),
    );
  }
}
