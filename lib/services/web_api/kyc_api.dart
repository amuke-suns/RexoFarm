import 'dart:io';

import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/next_of_kin.dart';
import 'package:rexofarm/models/vehicle.dart';

abstract class KycApi {
  Future<ApiResponse> uploadVehicleDetails(String token, Vehicle vehicle);

  Future<ApiResponse> uploadNinImage(File imageFile, String token);

  Future<ApiResponse> uploadVehicleImages({
    required String token,
    required String vehicleId,
    required List<File> files,
  });

  Future<ApiResponse> uploadLicenseImages({
    required String token,
    required List<File> files,
  });

  Future<ApiResponse> uploadDriversProfile({
    required String token,
    required String state,
    required String city,
    required String address,
  });

  Future<ApiResponse> uploadNextOfKinDetails({
    required String token,
    required NextOfKin kin,
  });
}
