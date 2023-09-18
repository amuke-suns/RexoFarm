import 'dart:convert';

import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/driver.dart';
import 'package:rexofarm/models/user.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

import 'auth_api.dart';

class AuthApiImpl implements AuthApi {
  final String _baseUrl = 'rexofarm-logistics-api.onrender.com';

  @override
  Future<ApiResponse> login({
    required String email,
    required String password,
  }) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = "v1/auth/sign-in";

    try {
      response = await http.post(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{},
        body: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );
    } catch (error) {
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
      return apiResponse;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      // log in successful
      final token = jsonDecode(response.body)["data"]["token"];
      apiResponse = ApiResponse.completed(token: token);
    } else {
      // Bad request error (e.g., email or password is invalid)
      apiResponse = ApiResponse.error(
        "Invalid email or password! Please check.",
      );
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> signUp(User user) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = 'v1/auth/sign-up'; // Replace with the actual API endpoint

    try {
      response = await http.post(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{},
        body: <String, dynamic>{
          'firstName': user.firstName,
          'lastName': user.lastName,
          'phone': user.phoneNumber,
          'email': user.email,
          'password': user.password,
        },
      );
    } catch (error) {
      apiResponse = ApiResponse.error(
          'Please check your internet connection and try again');
      return apiResponse;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      // account created successfully
      final token = jsonDecode(response.body)["data"]["token"];
      apiResponse = ApiResponse.completed(token: token);
    } else if (response.statusCode == 400) {
      // Bad request error (e.g., email or password is invalid)
      apiResponse =
          ApiResponse.error("Invalid email or password! Please check.");
    } else if (response.statusCode == 409) {
      // Duplicate key error (email already registered)
      apiResponse = ApiResponse.existingEmail(
          "Email already registered! Please sign in instead.");
    } else {
      // general error occurred. Please try again
      apiResponse = ApiResponse.error("Error occurred! Please try again");
    }

    return apiResponse;
  }
}
