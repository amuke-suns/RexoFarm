import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/accepted_deliveries.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/driver.dart';
import 'package:rexofarm/models/pickup_requests.dart';
import 'package:rexofarm/services/storage/secure_storage.dart';
import 'package:rexofarm/services/web_api/dashboard_api.dart';
import 'package:rexofarm/services/web_api/dashboard_api_impl.dart';

class HomeViewModel extends ChangeNotifier {
  String? token;
  Driver? _driver;
  bool _isGettingUser = true;
  bool get isGettingUser => _isGettingUser;

  List<PickupRequest>? requests;
  List<ParticularDelivery>? deliveries;

  Driver? get driver => _driver;

  Future<void> getUser() async {
    final response = await DashboardApiImpl().getUser(token!);

    _isGettingUser = false;

    _driver = response.data as Driver;

    notifyListeners();
  }

  void getPickupRequests() async {
    final response = await DashboardApiImpl().getPickupRequests(token!);

    requests = (response.data as PickupRequests?)?.list ?? [];

    notifyListeners();
  }

  Future<ApiResponse> acceptPickupRequest(String pickupId) async {
    final response = await DashboardApiImpl().acceptPickupRequest(
      token: token!,
      pickupId: pickupId,
    );

    return response;
  }

  Future<void> getAcceptedDeliveries() async {

    final response = await DashboardApiImpl().fetchAcceptedRequest(token!);
    deliveries = (response.data as AcceptedDeliveries?)?.list ?? [];

    notifyListeners();
  }

  void loadData() {
    getPickupRequests();
    getAcceptedDeliveries();
  }

  void refreshData() async {
    requests = null;
    deliveries = null;

    notifyListeners();

    getPickupRequests();
    getAcceptedDeliveries();
  }

  void deleteCurrentUserData() {
    token = null;
    _driver = null;
    requests = null;
    deliveries = null;
  }
}
