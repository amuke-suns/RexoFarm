import 'package:flutter/material.dart';
import 'package:rexofarm/models/shipment_mock.dart';
import 'package:rexofarm/screens/shipment_details_page.dart';

enum ShipmentStatus {
  latest(value: 'New', color: Color(0xff00a836)),
  accepted(value: 'Accepted', color: Color(0xFF527E84)),
  completed(value: "Completed", color: Color(0xff00a836)),
  ongoing(value: "Ongoing", color: Color(0xfff29528));

  const ShipmentStatus({
    required this.value,
    required this.color,
  });

  final String value;
  final Color color;
}

class ShipmentCard extends StatelessWidget {
  final Shipment shipment;

  const ShipmentCard({
    Key? key,
    required this.shipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShipmentDetailsPage(shipment: shipment);
        }));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        padding: const EdgeInsets.fromLTRB(8, 9, 8, 9),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xfff6f6f6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shipment.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 1.0714285714,
                    color: Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  shipment.address,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
            Text(
              shipment.status.value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.25,
                color: shipment.status.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
