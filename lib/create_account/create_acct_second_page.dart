import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/widgets/goto_auth.dart';
import 'package:rexofarm/widgets/main_page_button.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/third_party_sign_up.dart';
import 'login_page.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreateAccountSecondPage extends StatefulWidget {
  const CreateAccountSecondPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccountSecondPage> createState() =>
      _CreateAccountSecondPageState();
}

class _CreateAccountSecondPageState extends State<CreateAccountSecondPage>
    with AlertUtils {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  final PageController _controller = PageController(initialPage: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 68, left: 100, right: 100),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: const Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 8,
                    width: 46,
                    margin:
                        const EdgeInsets.only(left: 100, right: 100, top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: SmoothPageIndicator(
                        count: 2,
                        controller: _controller,
                        axisDirection: Axis.horizontal,
                        effect: const ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 8,
                          dotColor: Colors.grey,
                          activeDotColor: Color(0xFF006E21),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 37),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputField(
                            labelText: 'Email Address',
                            onSaved: (text) {
                              Provider.of<AuthViewModel>(
                                context,
                                listen: false,
                              ).emailAddress = text ?? "";
                            },
                            validator: Validators.validateEmail,
                            hintText: 'johndoe@gmail.com',
                          ),
                          const SizedBox(height: 29),
                          InputField(
                            labelText: 'Password',
                            onSaved: (text) {
                              Provider.of<AuthViewModel>(
                                context,
                                listen: false,
                              ).password = text ?? "";
                            },
                            validator: Validators.validatePassword,
                            hintText: '*****************',
                            obscureText: true,
                            showToggle: true,
                          ),
                          const SizedBox(height: 40),
                          MainPageButton(
                            label: 'Sign Up',
                            onPressed: () => _signUpButtonPressed(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ThirdPartySignUpWidget(),
                  GoToAuth(
                    label: 'Already have an account?',
                    buttonLabel: "Login",
                    buttonOnPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                          // Replace with your LoginPage widget
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _signUpButtonPressed(BuildContext context) async {
    final form = _formKey.currentState!;
    if (form.validate()) {
      showLoadingAlert(context, text: "Signing up");
      form.save();

      final response = await Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).registerUser();

      handleResponse(context, response);
    }
  }

  void handleResponse(BuildContext context, ApiResponse response) {
    dismissLoader(context);
    switch (response.status) {
      case ResponseStatus.completed:
        const snackBar = SnackBar(
          content: Text('Account created successfully'),
          behavior: SnackBarBehavior.floating,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
        break;
      case ResponseStatus.error:
      case ResponseStatus.existingEmail:
      case ResponseStatus.notYetVerified:
      case ResponseStatus.invalidEmailOrPassword:
        showMessageAlert(
          context,
          title: "Error occurred",
          body: response.message ?? "",
        );
    }
  }
}
