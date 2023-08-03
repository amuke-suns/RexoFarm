import 'package:flutter/foundation.dart';
import 'package:rexofarm/services/storage/secure_storage.dart';
import 'package:rexofarm/services/web_api/dashboard_api.dart';

class HomeViewModel extends ChangeNotifier {
  final String token;

  HomeViewModel({
    required this.token,
  });

  Future<void> mockPlaceOrder() async {
    return DashboardApiImpl().mockPlaceOrder(
      token: token,
      order:Order(
          orderId: '2',
          pickupLocation: 'OAU Campus',
          destination: 'Osun',
          buyer: 'Sunday',
          seller: 'Monday',
      ),
    );
  }

  Future<void> logout() async {
    return Future.delayed(const Duration(seconds: 2), () {
      SecureStorage().logoutUser();
    });
  }
}
