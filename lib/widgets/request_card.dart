import 'package:flutter/material.dart';
import 'package:rexofarm/models/pickup_requests.dart';
import 'package:rexofarm/screens/shipments/new_request_details_page.dart';

class RequestCard extends StatelessWidget {
  final PickupRequest pickupRequest;
  final Function() onTap;

  const RequestCard({
    Key? key,
    required this.pickupRequest,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delivery = pickupRequest.delivery;

    return GestureDetector(
      onTap: onTap,
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
                  delivery.buyer,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 1.0714285714,
                    color: Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  delivery.pickupLocation,
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
              delivery.status.text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.25,
                color: delivery.status.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
