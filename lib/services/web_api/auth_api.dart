import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/user.dart';

abstract class AuthApi {
  Future<ApiResponse> login({
    required String email,
    required String password,
  });

  Future<ApiResponse> signUp(User user);
}
