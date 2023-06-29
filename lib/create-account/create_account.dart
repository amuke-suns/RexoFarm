// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rexofarm/create-account/create_account1.dart';
import 'login_page.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/inputs/input_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

class SecondCreateAccountPage extends StatefulWidget {
  const SecondCreateAccountPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  _SecondCreateAccountPageState createState() => _SecondCreateAccountPageState();
}

late String? successMessage;
late Map<String, dynamic>? responseData;
bool isLoading = false;

class _SecondCreateAccountPageState extends State<SecondCreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 68, left: 100, right: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0)),
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
                margin: const EdgeInsets.only(left: 100, right: 100, top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: SmoothPageIndicator(
                    count: 2,
                    controller: _controller,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect (
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
                    InputField(
                      labelText: 'Email Address',
                      controller: emailController,
                      validator: Validators.validateEmail,
                      placeholderText: 'johndoe@gmail.com',
                    ),
                    const SizedBox(height: 29),
                    InputField(
                      labelText: 'Password',
                      controller: passwordController,
                      validator: Validators.validatePassword,
                      placeholderText: '*****************',
                      obscureText: true,
                      showToggle: true,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 53,
                      width: 358,
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _signUpButtonPressed,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.fromLTRB(40, 19, 40, 19),
                          backgroundColor: isLoading ? Colors.grey : const Color.fromRGBO(0, 110, 33, 1),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text(
                                    'Sign Up',
                                     style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle "Third party signup" link click
                        },
                        child: const Text(
              'Third party sign up',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF767873),
              ),
            ),
                      ),
                    ),
                    const SizedBox(height: 24),
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
              const SizedBox(height: 140),
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
              // const SizedBox(height: 142),
            ],
          ),
        ),
      ),
    );
  }

  void _signUpButtonPressed() {
    if (_formKey.currentState!.validate()) {
      // Send the API request with the collected data
      _createAccount();
    }
  }

  Future<void> _createAccount() async {
    setState(() {
      isLoading = true; // Enable loading state
    });
    const url = 'https://rexofarm-logistics-api.onrender.com/v1/auth/sign-up'; // Replace with the actual API endpoint

    final body = {
      'firstName': widget.user.firstName,
      'lastName': widget.user.lastName,
      'phone': widget.user.phoneNumber,
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      final response = await http.post(Uri.parse(url), body: body);
      final responseBody = response.body;
      final decodedResponse = json.decode(responseBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        const snackBar = SnackBar(
          content: Text('Account created successfully'),
          behavior: SnackBarBehavior.floating,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPageState(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        );
      } else if (response.statusCode == 400) {
        // Bad request error (e.g., email or password is invalid)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Check your credentials'),
            content: const Text("Email must be an email. Password must be longer than or equal to 8 characters."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (response.statusCode == 409) {
        // Duplicate key error (email already registered)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Email Already Registered'),
            content: const Text('The email address you entered is already registered. Please use a different email address.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        final messages = (decodedResponse['messages'] as List<dynamic>?) ?? [];
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Check your credentials'),
            content: Text(messages.join('\n')),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle the error here (e.g., show error message)
      print('Error: $error');
    } finally {
      setState(() {
        isLoading = false; // Disable loading state
      });
    }
  }
}
