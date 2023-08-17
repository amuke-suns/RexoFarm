import 'dart:io';

import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/user.dart';
import 'package:rexofarm/models/vehicle.dart';

abstract class AuthApi {
  Future<ApiResponse> login({
    required String email,
    required String password,
  });

  Future<ApiResponse> signUp(User user);

  Future<ApiResponse> getUser(String token);
}
