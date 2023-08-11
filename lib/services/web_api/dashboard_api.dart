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
  Future<void> mockPlaceOrder({
    required String token,
    required Order order,
  });

  Future<ApiResponse> getUser(String token);

  Future<ApiResponse> getPickupRequests(String token);

  Future<ApiResponse> fetchAcceptedRequest(String token);

  Future<ApiResponse> getParticularRequest(String token, String id);

  Future<ApiResponse> acceptPickupRequest({
    required String token,
    required String pickupId,
  });
}
