import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/services/web_api/auth_api_impl.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  String email = '';
  String? otp;
  String? token;
  late String _password;

  set password(String value) => _password = value;

  set newOtp(String? value) {
    otp = value;
    notifyListeners();
  }

  Future<ApiResponse> initiate() async {
    final response = await AuthApiImpl().resetPasswordInitiate(email: email);

    token = response.token;
    return response;
  }

  Future<ApiResponse> validate() async {
    final response = await AuthApiImpl().resetPasswordValidate(
      verificationToken: token!,
      otp: otp!,
    );
    // set the new token after validation
    token = response.token;
    return response;
  }

  Future<ApiResponse> complete() async {
    final response = await AuthApiImpl().resetPasswordComplete(
      verificationToken: token!,
      password: _password,
    );

    return response;
  }
}
