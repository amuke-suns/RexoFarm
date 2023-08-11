import 'package:flutter/material.dart';

enum DeliveryStatus {
  // unassigned, assigned, ongoing, delivered
  unassigned(
    text: 'Unassigned',
    color: Color(0xFF527E84),
    value: 'unassigned',
  ),
  assigned(
    text: 'Accepted',
    color: Color(0xff00a836),
    value: 'assigned',
  ),
  ongoing(
    text: "Ongoing",
    color: Color(0xfff29528),
    value: 'ongoing',
  ),
  delivered(
    text: "Delivered",
    color: Color(0xff00a836),
    value: 'delivered',
  );

  const DeliveryStatus({
    required this.text,
    required this.color,
    required this.value,
  });

  final String text;
  final Color color;
  final String value;
}
