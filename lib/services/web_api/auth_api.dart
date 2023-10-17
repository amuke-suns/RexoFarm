import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/user.dart';

abstract class AuthApi {
  Future<ApiResponse> login({
    required String email,
    required String password,
  });

  Future<ApiResponse> signUp(User user);

  Future<ApiResponse> resetPasswordInitiate({
    // required String token,
    required String email,
  });

  Future<ApiResponse> resetPasswordValidate({
    required String verificationToken,
    required String otp,
  });

  Future<ApiResponse> resetPasswordComplete({
    required String verificationToken,
    required String password,
  });

  Future<ApiResponse> changePassword({
    required String token,
    required String oldPassword,
    required String newPassword,
  });
}
