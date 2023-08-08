import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/driver.dart';
import 'package:rexofarm/models/pickup_requests.dart';
import 'package:rexofarm/services/storage/secure_storage.dart';
import 'package:rexofarm/services/web_api/dashboard_api.dart';
import 'package:rexofarm/services/web_api/dashboard_api_impl.dart';

class HomeViewModel extends ChangeNotifier {
  String? _token;
  Driver? _driver;

  PickupRequests? requests;

  Driver? get driver => _driver;

  set token(String token) => _token = token;

  Future<void> mockPlaceOrder() async {
    return DashboardApiImpl().mockPlaceOrder(
      token: _token!,
      order: Order(
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

  Future<void> getUser() async {
    final response = await DashboardApiImpl().getUser(_token!);

    _driver = response.data as Driver;

    notifyListeners();
  }

  Future<List<PickupRequest>> getPickupRequests() async {
    final response = await DashboardApiImpl().getPickupRequests(_token!);

    return (response.data as PickupRequests?)?.list ?? [];
  }

  Future<ApiResponse> acceptPickupRequest(String pickupId) async {
    final response = await DashboardApiImpl().acceptPickupRequest(
      token: _token!,
      pickupId: pickupId,
    );

    return response;
  }
}
