import 'dart:convert';

import 'package:rexofarm/models/pickup_requests.dart';
import 'package:rexofarm/services/web_api/dashboard_api.dart';
import 'package:http/http.dart' as http;
import 'package:rexofarm/models/driver.dart';

import 'package:rexofarm/models/api_response.dart';

class DashboardApiImpl implements DashboardApi {
  final String _baseUrl = 'rexofarm-logistics-api.onrender.com';

  @override
  Future<void> mockPlaceOrder({
    required String token,
    required Order order,
  }) async {
    http.Response response;

    String endpoint = 'v1/delivery/mock-place-orders';

    try {
      response = await http.post(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: <String, dynamic>{
          "orderId": order.orderId,
          "pickupLocation": order.pickupLocation,
          "destination": order.destination,
          "buyer": order.buyer,
          "seller": order.seller,
        },
      );

      print(response.body);
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<ApiResponse> getUser(String token) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = 'v1/auth/fetch-me';

    try {
      response = await http.get(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    } catch (error) {
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
      return apiResponse;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      final driver = Driver.fromJson(json, token);
      apiResponse = ApiResponse.completedWithData(data: driver);
    } else {
      apiResponse = ApiResponse.error(
        "Error occurred while uploading! Please try again",
      );
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> getPickupRequests(String token) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = '/v1/delivery/pickup-request/fetch';

    try {
      response = await http.get(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    } catch (error) {
      print(error);
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
      return apiResponse;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      final pickupRequests = PickupRequests.fromJson(json);
      apiResponse = ApiResponse.completedWithData(data: pickupRequests);
    } else {
      apiResponse = ApiResponse.error(
        "Error occurred while uploading! Please try again",
      );
    }

    return apiResponse;
  }

  @override
  Future<ApiResponse> getParticularRequest(String token, String id) {
    // TODO: implement getParticularRequest
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> acceptPickupRequest({
    required String token,
    required String pickupId,
  }) async {
    ApiResponse apiResponse;
    http.Response response;

    String endpoint = 'v1/delivery/pickup-request/$pickupId/accept';

    try {
      response = await http.post(
        Uri.https(_baseUrl, endpoint),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    } catch (error) {
      print(error);
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
      return apiResponse;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      apiResponse = ApiResponse.completed(token: token);
    } else {
      print('Error: ${response.body}');
      final json = jsonDecode(response.body);
      apiResponse = ApiResponse.error(json["message"]);
    }

    return apiResponse;
  }
}
