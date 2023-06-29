import 'package:flutter/material.dart';
import 'package:rexofarm/create-account/create_account1.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      
    home: RexoFarmApp(),
  ),
  );
}

class RexoFarmApp extends StatelessWidget {
  const RexoFarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RexoFarm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.orange,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      home: const CreateAccountPage(),
    );
  }

  Future<void> loginUser(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('https://rexofarm-logistics-api.onrender.com/v1/auth/sign-up'),
      body: {
        'email': email,
        'password': password,
        'firstName': '',
        'lastName': '',
        'phoneNumber': '',
      },
    );

    if (response.statusCode == 200) {
      // Login successful, process the response
      // You can store the session token or user information here
      // or navigate to another screen indicating successful login
    } else {
      // Login failed, handle the error
      // You can display an error message to the user
    }
  } catch (e) {
    // Handle any exceptions or network errors
  }
}

}

