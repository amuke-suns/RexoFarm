import 'dart:convert';

import 'package:rexofarm/models/accepted_deliveries.dart';

class PickupRequests {
  final List<PickupRequest> list;

  PickupRequests({required this.list});

  factory PickupRequests.fromJson(List<dynamic> data) {
    return PickupRequests(
      list: data.map((json) => PickupRequest.fromJson(json)).toList(),
    );
  }
}

class PickupRequest {
  final String id;
  final String status;
  final String driverId;
  final String vehicleId;
  final String orderId;
  final ParticularDelivery delivery;
  final DateTime createdAt;
  final DateTime updatedAt;

  PickupRequest({
    required this.id,
    required this.status,
    required this.driverId,
    required this.vehicleId,
    required this.orderId,
    required this.delivery,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PickupRequest.fromJson(Map<String, dynamic> json) {
    return PickupRequest(
      id: json['_id'],
      status: json['status'],
      driverId: json['driver'],
      vehicleId: json['vehicle'],
      orderId: json['orderId'],
      delivery: ParticularDelivery.fromJson(json['delivery']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

