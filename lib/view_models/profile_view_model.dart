import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/RegisteredVehicles.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/vehicle.dart';
import 'package:rexofarm/services/storage/secure_storage.dart';
import 'package:rexofarm/services/web_api/dashboard_api_impl.dart';
import 'package:rexofarm/services/web_api/kyc_api_impl.dart';

class ProfileViewModel extends ChangeNotifier {
  String? _token;
  List<RegisteredVehicle>? vehicles;

  Vehicle vehicle = Vehicle();
  String? _vehicleId;

  init(String token) {
    _token = token;
    getAllVehicles();
  }

  Future<void> logout() async {
    return Future.delayed(const Duration(seconds: 2), () {
      SecureStorage().logoutUser();
    });
  }

  Future<void> getAllVehicles() async {
    final response = await DashboardApiImpl().getAllVehicles(_token!);

    vehicles = (response.data as RegisteredVehicles?)?.list ?? [];

    notifyListeners();
  }

  Future<ApiResponse> deleteVehicle(String id) async {
    final response = await DashboardApiImpl().deleteVehicle(
      token: _token!,
      vehicleId: id,
    );

    return response;
  }

  Future<ApiResponse> uploadVehicleDetails() async {
    final response = await KycApiImpl().uploadVehicleDetails(
      _token!,
      vehicle,
    );

    if (response.status == ResponseStatus.completedWithData) {
      _vehicleId = response.data as String;
    }

    return response;
  }

  Future<ApiResponse> uploadVehicleImages({
    required List<File> files,
  }) async {
    return KycApiImpl().uploadVehicleImages(
      token: _token!,
      vehicleId: _vehicleId!,
      files: files,
    );
  }

  void refreshData() async {
    vehicles = null;

    notifyListeners();

    getAllVehicles();
  }
}
