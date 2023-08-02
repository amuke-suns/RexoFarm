import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:rexofarm/models/shipment_mock.dart';

class MockApi {
  Future<List<Shipment>> getMockShipments() async {
    return Future.delayed(const Duration(seconds: 2), () async {
      final String jsonString = await rootBundle.loadString('assets/shipments.json');
      final data = jsonDecode(jsonString);

      return ShipmentsMock.fromJson(data).list;
    });
  }
}
