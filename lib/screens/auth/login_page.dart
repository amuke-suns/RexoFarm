import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/screens/kyc_upload/license_front_page.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/widgets/goto_auth.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/widgets/main_page_button.dart';
import 'package:rexofarm/widgets/third_party_sign_up.dart';

import 'create_acct.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AlertUtils {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputField(
                              labelText: 'Email Address',
                              onSaved: (text) {
                                Provider.of<AuthViewModel>(context,
                                        listen: false)
                                    .emailAddress = text ?? "";
                              },
                              validator: Validators.validateEmail,
                              hintText: 'Enter your email address',
                            ),
                            const SizedBox(height: 30),
                            InputField(
                              labelText: 'Password',
                              onSaved: (text) {
                                Provider.of<AuthViewModel>(context,
                                        listen: false)
                                    .password = text ?? "";
                              },
                              validator: Validators.validatePassword,
                              hintText: 'Enter your password',
                              obscureText: true,
                              showToggle: true,
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Handle "Reset password" logic
                                },
                                child: const Text(
                                  'Reset password',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: kAppPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            MainPageButton(
                              label: "Log in",
                              onPressed: _loginButtonPressed,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ThirdPartySignUpWidget(),
                    GoToAuth(
                      label: 'Don\'t have an account?',
                      buttonLabel: 'Sign up',
                      buttonOnPressed: () {
                        NavigationUtils.goTo(
                          context,
                          const CreateAccountPage(),
                        );
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

  void _loginButtonPressed() async {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      showLoadingAlert(context, text: 'Logging in');

      final response =
          await Provider.of<AuthViewModel>(context, listen: false).loginUser();

      handleResponse(response);
    }
  }

  void handleResponse(ApiResponse response) {
    dismissLoader(context);
    if (response.status == ResponseStatus.completed) {
      // Clear the navigation stack and go to the KYC page
      NavigationUtils.clearStackAndGoTo(context, const LicenseFrontPage());
    } else {
      showMessageAlert(
        context,
        title: "Error occurred",
        body: response.message ?? "",
      );
    }
  }
}
