import 'package:flutter/material.dart';
import 'package:rexofarm/models/accepted_deliveries.dart';

class AcceptedDeliveryCard extends StatelessWidget {
  final ParticularDelivery acceptedDelivery;


  const AcceptedDeliveryCard({
    Key? key,
    required this.acceptedDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PickupDetailsPage(pickupRequest: acceptedDelivery);
        }));*/
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
                  acceptedDelivery.buyer,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 1.0714285714,
                    color: Color(0xff000000),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  acceptedDelivery.pickupLocation,
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
              acceptedDelivery.status.text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.25,
                color: acceptedDelivery.status.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
