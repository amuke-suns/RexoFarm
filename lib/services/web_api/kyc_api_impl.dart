import 'dart:convert';
import 'dart:io';

import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/next_of_kin.dart';
import 'package:rexofarm/models/vehicle.dart';
import 'package:rexofarm/services/web_api/kyc_api.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class KycApiImpl implements KycApi {
  final String _baseUrl = 'rexofarm-logistics-api.onrender.com';

  @override
  Future<ApiResponse> uploadVehicleDetails(
    String token,
    Vehicle vehicle,
  ) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = 'v1/vehicle/create';

    try {
      response = await http.post(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: <String, dynamic>{
          "vehicleType": vehicle.type,
          "vehicleMake": vehicle.make,
          "vehicleModel": vehicle.model,
          "numberPlate": vehicle.plate,
        },
      );

      print(response.body);
    } catch (error) {
      apiResponse = ApiResponse.error(
          'Please check your internet connection and try again');
      return apiResponse;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      String id = json['data']['_id'];

      // return the id of the created vehicle as well.
      apiResponse = ApiResponse.completedWithData(data: id);
    } else {
      final json = jsonDecode(response.body);
      apiResponse = ApiResponse.error(json['message']);
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> uploadNinImage(File imageFile, String token) async {
    ApiResponse apiResponse;
    http.StreamedResponse response;

    try {
      // open a byte stream, cast it and get file length
      var stream = http.ByteStream(imageFile.openRead());
      stream.cast();
      var length = await imageFile.length();
      // string to uri
      var uri = Uri.parse("https://$_baseUrl/kyc/nin");
      // create multipart request
      var request = http.MultipartRequest("POST", uri);
      request.headers["Authorization"] = 'Bearer $token';

      // multipart that takes file
      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: p.basename(imageFile.path),
      );
      // add file to multipart
      request.files.add(multipartFile);
      // send
      response = await request.send();
    } catch (e) {
      return ApiResponse.error(
        'Error occurred! Please check internet connection and try again',
      );
    }

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      apiResponse = ApiResponse.completed(token: token);
    } else {
      final json = jsonDecode(responseString);
      apiResponse = ApiResponse.error(json['message']);
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> uploadVehicleImages({
    required String token,
    required String vehicleId,
    required List<File> files,
  }) async {
    ApiResponse apiResponse;
    http.StreamedResponse response;

    try {
      // string to uri
      var uri = Uri.parse(
        "https://$_baseUrl/v1/vehicle/upload-images/$vehicleId",
      );
      // create multipart request
      var request = http.MultipartRequest("POST", uri);
      request.headers["Authorization"] = 'Bearer $token';

      for (File file in files) {
        // open a byte stream, cast it and get file length
        var stream = http.ByteStream(file.openRead());
        stream.cast();
        var length = await file.length();
        // multipart that takes file
        var multipartFile = http.MultipartFile(
          'files',
          stream,
          length,
          filename: p.basename(file.path),
        );
        // add file to multipart
        request.files.add(multipartFile);
      }
      // send
      response = await request.send();
    } catch (e) {
      print(e);
      return ApiResponse.error(
        'Error occurred! Please check internet connection and try again',
      );
    }

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      apiResponse = ApiResponse.completed(token: token);
    } else {
      final json = jsonDecode(responseString);
      apiResponse = ApiResponse.error(json['message']);
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> uploadDriversProfile({
    required String token,
    required String state,
    required String city,
    required String address,
  }) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = 'v1/driver/profile';

    try {
      response = await http.patch(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: <String, dynamic>{
          'state': state,
          'city': city,
          'address': address,
        },
      );
    } catch (error) {
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
      return apiResponse;
    }

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // account created successfully
      apiResponse = ApiResponse.completed(token: token);
    } else {
      apiResponse = ApiResponse.error(
        'Error occurred! Please try uploading again',
      );
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> uploadNextOfKinDetails({
    required String token,
    required NextOfKin kin,
  }) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = 'v1/driver/next-of-kin';

    try {
      response = await http.patch(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: <String, dynamic>{
          "fullName": '${kin.firstName} ${kin.firstName}',
          "gender": kin.gender,
          "relationship": kin.relationship,
          "phone": kin.phoneNumber,
          "state": kin.state,
          "city": kin.city,
          "address": kin.address,
        },
      );
    } catch (error) {
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
      return apiResponse;
    }

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // account created successfully
      apiResponse = ApiResponse.completed(token: token);
    } else {
      apiResponse = ApiResponse.error(
        'Error occurred! Please try uploading again',
      );
    }

    return apiResponse;
  }
}
