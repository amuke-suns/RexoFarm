import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/drivers_address.dart';
import 'package:rexofarm/models/next_of_kin.dart';
import 'package:rexofarm/models/vehicle.dart';
import 'package:rexofarm/services/web_api/kyc_api_impl.dart';

class KycViewModel extends ChangeNotifier {
  String? _id;

  Vehicle vehicle = Vehicle();

  DriversAddress driversAddress = DriversAddress();

  NextOfKin kin = NextOfKin();

  File? _frontLicense;
  File? _backLicense;

  set frontLicense(File file) => _frontLicense = file;
  set backLicense(File file) => _backLicense = file;

  Future<ApiResponse> uploadNinImage({
    required File file,
    required String token,
  }) {
    return KycApiImpl().uploadNinImage(
      file,
      token,
    );
  }

  Future<ApiResponse> uploadVehicleDetails(String userToken) async {
    final response = await KycApiImpl().uploadVehicleDetails(
      userToken,
      vehicle,
    );

    if (response.status == ResponseStatus.completedWithData) {
      _id = response.data as String;
    }

    return response;
  }

  Future<ApiResponse> uploadVehicleImages({
    required String userToken,
    required List<File> files,
  }) async {
    return KycApiImpl().uploadVehicleImages(
      token: userToken,
      vehicleId: _id!,
      files: files,
    );
  }

  Future<ApiResponse> uploadLicenseImages({
    required String userToken,
    required File backLicenseImage,
  }) async {
    _backLicense = backLicenseImage;

    return KycApiImpl().uploadLicenseImages(
      token: userToken,
      files: [_frontLicense!, _backLicense!],
    );
  }

  Future<ApiResponse> uploadDriversProfile(String token) async {
    return KycApiImpl().uploadDriversProfile(
      token: token,
      state: driversAddress.state,
      city: driversAddress.city,
      address: driversAddress.address,
    );
  }

  Future<ApiResponse> uploadNextOfKinDetails(String token) async {
    return KycApiImpl().uploadNextOfKinDetails(token: token, kin: kin);
  }
}
