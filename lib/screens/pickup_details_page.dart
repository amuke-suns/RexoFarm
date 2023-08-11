import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/pickup_requests.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/home_view_model.dart';

class PickupDetailsPage extends StatelessWidget with AlertUtils {
  final PickupRequest pickupRequest;

  const PickupDetailsPage({
    Key? key,
    required this.pickupRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delivery = pickupRequest.delivery;

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
                        DoubleTextsWithHeaders(
                          firstHeader: 'Order Item',
                          firstText: delivery.items.first.item,
                          secondHeader: 'Quantity',
                          secondText: delivery.items.first.quantity.toString(),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: kAppPrimaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(40, 19, 40, 19),
                            ),
                            child: const Text('Decline'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _onAcceptPressed(context),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(40, 19, 40, 19),
                              backgroundColor: kAppPrimaryColor,
                            ),
                            child: const Text('Accept'),
                          ),
                        )
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

  _onAcceptPressed(BuildContext context) async {
    showLoadingAlert(context, text: 'Accepting');

    final response = await Provider.of<HomeViewModel>(
      context,
      listen: false,
    ).acceptPickupRequest(pickupRequest.id);

    if (context.mounted) {
      dismissLoader(context, rootNavigator: true);

      if (response.status == ResponseStatus.completed) {
        showInfoSnackBar(
            context,
            description: 'Accepted successfully',
            type: AlertType.success,
        );
        Navigator.pop(context, true);
      } else {
        showInfoSnackBar(
            context,
            description: response.message ?? 'Error occurred',
            type: AlertType.error,
        );
      }
    }
  }
}

class DoubleTextsWithHeaders extends StatelessWidget {
  final String firstHeader;
  final String firstText;
  final String secondHeader;
  final String secondText;

  const DoubleTextsWithHeaders({
    Key? key,
    required this.firstHeader,
    required this.firstText,
    required this.secondHeader,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextWithHeader(
            header: firstHeader,
            text: firstText,
          ),
        ),
        Expanded(
          child: TextWithHeader(
            header: secondHeader,
            text: secondText,
          ),
        ),
      ],
    );
  }
}

class TextWithHeader extends StatelessWidget {
  final String header;
  final String? text;
  final Widget? bodyWidget;

  const TextWithHeader({
    super.key,
    required this.header,
    this.text,
    this.bodyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(fontSize: 11, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          bodyWidget ??
              Text(
                text!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
          const Divider(),
        ],
      ),
    );
  }
}
