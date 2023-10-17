import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rexofarm/models/shipment_mock.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/widgets/double_texts_with_headers.dart';
import 'package:rexofarm/widgets/text_with_header.dart';

class ShipmentDetailsPage extends StatelessWidget {
  final Shipment shipment;

  const ShipmentDetailsPage({
    Key? key,
    required this.shipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipment details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8),
                Text(
                  DateFormat().add_jm().add_yMMMMd().format(shipment.date),
                  style: const TextStyle(
                    backgroundColor: kAppSecondaryColor,
                  ),
                )
              ],
            ),
            const TextWithHeader(header: 'Buyer', text: 'Sunday Amuke'),
            const TextWithHeader(header: 'Seller', text: 'Emmanuella Osuolla'),
            const DoubleTextsWithHeaders(
              firstHeader: 'Driver',
              firstText: 'Feyisayo Peter',
              secondHeader: 'Vehicle Type',
              secondText: 'Hyundai Van',
            ),
            const TextWithHeader(
              header: 'Delivery location',
              text: 'Ibadan road, Ile-Ife, Osun state.',
            ),
            DoubleTextsWithHeaders(
              firstHeader: 'Order Item',
              firstText: shipment.name,
              secondHeader: 'Quantity',
              secondText: '4',
            ),
            TextWithHeader(
              header: 'Status',
              bodyWidget: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: shipment.status.color,
                    size: 12,
                  ),
                  Text(shipment.status.value),
                ],
              ),
            ),
            const TextWithHeader(
              header: 'Order ID',
              text: '236900514823974',
            )
          ],
        ),
      ),
    );
  }
}
