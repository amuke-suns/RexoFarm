import 'package:flutter/material.dart';
import 'package:rexofarm/models/shipment_mock.dart';

import 'shipment_card.dart';

class ShipmentsListBuilder extends StatelessWidget {
  final List<Shipment> data;

  const ShipmentsListBuilder({Key? key, required this.data}) : super(key: key);

  List<Widget> _buildColumnChildren() {
    List<Widget> children = [];

    List<String> header = ['Today', 'Yesterday', 'Older'];
    List<List<Shipment>> lists = [
      data.getToday(),
      data.getYesterday(),
      data.getOlder(),
    ];

    for (int i = 0; i < lists.length; i++) {
      final list = lists[i];

      if (list.isNotEmpty) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              header[i],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );

        for (Shipment s in list) {
          children.add(ShipmentCard(shipment: s));
        }
      }
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildColumnChildren(),
      ),
    );
  }
}
