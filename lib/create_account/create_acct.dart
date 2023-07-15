import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/create_account/login_page.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/widgets/goto_auth.dart';
import '../widgets/third_party_sign_up.dart';
import 'create_acct_first_page.dart';
import 'create_acct_second_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController =
      TextEditingController(text: '');

  void _navigateToSecondCreateAccountPage() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateAccountSecondPage(),
        ),
      );
    }
  }

  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  children: [
                    const Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SmoothPageIndicator(
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
                    const SizedBox(height: 37),
                    Expanded(
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CreateAccountFirstPage(
                                  onNextPressed:
                                      _navigateToSecondCreateAccountPage,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ThirdPartySignUpWidget(),
                    GoToAuth(
                      label: 'Already have an account?',
                      buttonLabel: 'Login',
                      buttonOnPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                            // Replace with your LoginPage widget
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
