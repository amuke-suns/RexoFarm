import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/driver.dart';
import 'package:rexofarm/models/user.dart';

import '../services/web_api/auth_api_impl.dart';

class AuthViewModel extends ChangeNotifier {
  Driver? _driver;
  Driver? get driver => _driver;

  String? _userToken;

  String? get userToken => _userToken;

  String _firstName = "";
  String _lastName = "";
  String _phoneNumber = "";
  String _emailAddress = "";
  String _password = "";

  set firstName(String firstName) => _firstName = firstName;

  set lastName(String lastName) => _lastName = lastName;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  set emailAddress(String emailAddress) => _emailAddress = emailAddress;

  set password(String password) => _password = password;

  Future<ApiResponse> registerUser() async {
    final response = await AuthApiImpl().signUp(User(
      firstName: _firstName,
      lastName: _lastName,
      phoneNumber: _phoneNumber,
      email: _emailAddress,
      password: _password,
    ));

    return response;
  }

  Future<ApiResponse> loginUser() async {
    final response = await AuthApiImpl().login(
      email: _emailAddress,
      password: _password,
    );

    _userToken = response.token;

    return response;
  }

  Future<void> getUser() async {
    final response = await AuthApiImpl().getUser(userToken!);

    _driver = response.data as Driver;

    notifyListeners();
  }
}
