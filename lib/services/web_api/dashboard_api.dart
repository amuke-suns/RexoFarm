import 'package:rexofarm/models/api_response.dart';
import 'package:http/http.dart' as http;

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
}

class DashboardApiImpl implements DashboardApi {
  final String _baseUrl = 'rexofarm-logistics-api.onrender.com';

  @override
  Future<void> mockPlaceOrder({
    required String token,
    required Order order,
  }) async {
    ApiResponse apiResponse;
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
      apiResponse = ApiResponse.error(
        'Please check your internet connection and try again',
      );
    }
  }
}
