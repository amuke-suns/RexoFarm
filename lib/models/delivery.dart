import 'package:rexofarm/models/delivery_status.dart';

class Delivery {
  final String id;
  final DeliveryStatus status;
  final String orderId;
  final String pickupLocation;
  final String buyer;
  final String seller;
  final DateTime createdAt;
  final DateTime updatedAt;

  Delivery({
    required this.id,
    required this.status,
    required this.orderId,
    required this.pickupLocation,
    required this.buyer,
    required this.seller,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['_id'],
      status: DeliveryStatus.values.firstWhere(
        (element) => element.value == json['status'],
      ),
      orderId: json['orderId'],
      pickupLocation: json['pickupLocation'],
      buyer: json['buyer'],
      seller: json['seller'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
