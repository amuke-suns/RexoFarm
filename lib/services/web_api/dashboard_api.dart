import 'package:rexofarm/models/api_response.dart';

class Order {
  String orderId = '';
  String pickupLocation = '';
  String destination = '';
  String buyer = '';
  String seller = '';

  Order({
    this.orderId = '',
    this.pickupLocation = '',
    this.destination = '',
    this.buyer = '',
    this.seller = '',
  });
}

abstract class DashboardApi {

  Future<ApiResponse> getUser(String token);

  Future<ApiResponse> getPickupRequests(String token);

  Future<ApiResponse> fetchAcceptedRequest(String token);

  Future<ApiResponse> acceptPickupRequest({
    required String token,
    required String pickupId,
  });

  Future<ApiResponse> getAllVehicles(String token);

  Future<ApiResponse> deleteVehicle({
    required String token,
    required String vehicleId,
  });
}
