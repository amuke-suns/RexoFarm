import 'package:flutter/material.dart';
import 'package:rexofarm/screens/auth/login_page.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/widgets/main_page_button.dart';

class PasswordSuccessPage extends StatelessWidget {
  const PasswordSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/reset_password/tick-square.png'),
                    const SizedBox(height: 80),
                    const Text(
                      'Password reset successful',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Proceed to log into your account with your new password.',
                    ),
                    const SizedBox(height: 50),
                    MainPageButton(
                      label: 'Proceed to Login',
                      onPressed: () {
                        NavigationUtils.replacePage(context, const LoginPage());
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
