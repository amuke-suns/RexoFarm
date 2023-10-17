import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rexofarm/models/accepted_deliveries.dart';
import 'package:rexofarm/models/delivery_status.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/widgets/double_texts_with_headers.dart';
import 'package:rexofarm/widgets/text_with_header.dart';

class AcceptedShipmentDetailsPage extends StatelessWidget with AlertUtils {
  final ParticularDelivery delivery;

  const AcceptedShipmentDetailsPage({
    Key? key,
    required this.delivery,
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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat()
                                  .add_jm()
                                  .add_yMMMMd()
                                  .format(delivery.createdAt),
                              style: const TextStyle(
                                backgroundColor: kAppSecondaryColor,
                              ),
                            )
                          ],
                        ),
                        TextWithHeader(
                          header: 'Buyer',
                          text: delivery.buyer,
                        ),
                        TextWithHeader(
                          header: 'Seller',
                          text: delivery.seller,
                        ),
                        const DoubleTextsWithHeaders(
                          firstHeader: 'Driver',
                          firstText: 'Feyisayo Peter',
                          secondHeader: 'Vehicle Type',
                          secondText: 'Hyundai Van',
                        ),
                        TextWithHeader(
                          header: 'Delivery location',
                          text: delivery.pickupLocation,
                        ),
                        TextWithHeader(
                          header: 'Shipping location',
                          text: delivery.destination,
                        ),
                        DoubleTextsWithHeaders(
                          firstHeader: 'Order Item(s)',
                          firstText: delivery.items.getItemNames(),
                          secondHeader: 'Quantity',
                          secondText: delivery.items.getItemQty(),
                        ),
                        TextWithHeader(
                          header: 'Status',
                          bodyWidget: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: delivery.status.color,
                                size: 12,
                              ),
                              Text(delivery.status.value),
                            ],
                          ),
                        ),
                        TextWithHeader(
                          header: 'Order ID',
                          text: delivery.id,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding:
                            const EdgeInsets.fromLTRB(40, 19, 40, 19),
                            backgroundColor: kAppPrimaryColor,
                          ),
                          child: const Text('On Route to Pickup'),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: kDeepRed,
                          ),
                          child: const Text('Decline shipment'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
