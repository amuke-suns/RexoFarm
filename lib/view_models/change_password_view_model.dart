import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/services/web_api/auth_api_impl.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  String email = '';
  String currentPassword = '';

  String newPassword = '';

  Future<bool> checkPasswordByLogin(String email) async {
    final response = await AuthApiImpl().login(
      email: email,
      password: currentPassword,
    );

    // if true, it means that the correct password was entered
    return response.status == ResponseStatus.completed;
  }

  Future<ApiResponse> changePassword({required String token}) async {
    return AuthApiImpl().changePassword(
      token: token,
      oldPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
