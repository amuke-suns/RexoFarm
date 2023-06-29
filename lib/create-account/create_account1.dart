import 'package:flutter/material.dart';
import 'FirstCreateAccountPage.dart';
import 'create_account.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_page.dart';





class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController(text: '');
  final TextEditingController lastNameController = TextEditingController(text: '');
  final TextEditingController phoneNumberController = TextEditingController(text: '');

  void _navigateToSecondCreateAccountPage() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        email: '', // Initialize with an empty string
        password: '', // Initialize with an empty string
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondCreateAccountPage(user: user)),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 68, left: 100, right: 100,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 8,
                width: 46,
                margin: const EdgeInsets.only(left: 100, top: 8, right: 100),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FirstCreateAccountPage(
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      phoneNumberController: phoneNumberController,
                      onNextPressed: _navigateToSecondCreateAccountPage,
                    ),
                  ],
                ),
              ),
              
              Column(
                children: [
                  SizedBox(
                    height: 48,
                    width: 358,
                    child: Row(
                      children: [
                        Flexible(
                          
                          child: OutlinedButton(
                            onPressed: () {
                              // Handle Facebook login
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFF3F4EE),   
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                              
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/Google.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 110, 33, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: OutlinedButton(
                            onPressed: () {
                              // Handle Google login
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFF3F4EE), 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.only(left: 40, right: 34, top: 12, bottom: 12),
                              // side: const BorderSide(color: Color.fromRGBO(57, 101, 107, 1)),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/Facebook.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 110, 33, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text('Already have an account?',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF767873),
              ),
              ),
              TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageState(email: '', password: ''),
                           // Replace with your LoginPage widget
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 110, 33, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}