import 'package:flutter/material.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/inputs/input_field.dart';
import 'package:rexofarm/kyc/Kyc_page.dart';
import 'package:http/http.dart' as http;

import 'create_account1.dart';

class LoginPageState extends StatefulWidget {
  final String email;
  final String password;

  const LoginPageState({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isLoading = false;

class _LoginPageState extends State<LoginPageState> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;

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
                margin: const EdgeInsets.only(top: 68, left: 100, bottom: 48, right: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0)),
                child: const Text(
                  'Log in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      labelText: 'Email Address or Phone Number',
                      controller: emailController,
                      validator: Validators.validateEmail,
                      placeholderText: 'Enter your email address or phone number',
                    ),
                    const SizedBox(height: 40),
                    InputField(
                      labelText: 'Password',
                      controller: passwordController,
                      validator: Validators.validatePassword,
                      placeholderText: 'Enter your password',
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
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 110, 33, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 53,
                      width: 358,
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _loginButtonPressed,
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
                              'Log in',
                             style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                             ), ),
                      ),
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle "Third party signup" link click
                        },
                        child: const Text(
                          'Third party log in',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF767873),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 88),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text('Don\'t have an account?',
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
                          builder: (context) => CreateAccountPage(),
                           // Replace with your LoginPage widget
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
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

  void _loginButtonPressed() {
    if (_formKey.currentState!.validate()) {
      // Send the API request with the collected data
      _loginPageState();
    }
  }

  Future<void> _loginPageState() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://rexofarm-logistics-api.onrender.com/v1/auth/sign-in'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        const snackBar = SnackBar(
          content: Text('You have successfully logged in!'),
          behavior: SnackBarBehavior.floating,
        );

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KycPage(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        );
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid email or password.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      print(response.body);
      print(response.statusCode);
      print(response.reasonPhrase);
    } catch (e) {
      // Handle any exceptions or network errors
      print('Exception: $e');
    } finally {
      setState(() {
        isLoading = false; // Disable loading state
      });
    }
  }
}
