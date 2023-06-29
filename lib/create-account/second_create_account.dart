import 'package:flutter/material.dart';
import 'create_account.dart';
import 'create_account1.dart';

class SecondCreateAccount extends StatefulWidget {
  final User user;

  const SecondCreateAccount({Key? key, required this.user}) : super(key: key);

  @override
  _SecondCreateAccountState createState() => _SecondCreateAccountState();
}

class _SecondCreateAccountState extends State<SecondCreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SecondCreateAccountPage(user: widget.user),
    );
  }
}
