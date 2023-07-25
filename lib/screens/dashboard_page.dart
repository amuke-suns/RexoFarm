import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/shipment_mock.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/widgets/shipment_card.dart';
import 'package:rexofarm/widgets/profile_completeness_card.dart';
import 'package:rexofarm/widgets/see_more_button.dart';
import 'package:rexofarm/widgets/wallet_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void onWithdrawButtonPressed() {
    // Add your desired functionality when the withdraw button is pressed
    print('Withdraw button pressed');
  }

  void seeMoreButtonPressed() {
    // Add your desired functionality when the see more button is pressed
    print('See more button pressed');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context, listen: true);
    final dateNow = DateTime.now();
    final dateYesterday = dateNow.subtract(const Duration(days: 1));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hello ${provider.driver?.firstName ?? ''}',
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                'images/Notification.png',
                width: 32,
                height: 32,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 18, 0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const WalletCard(),
                        const SizedBox(height: 10),
                        const ProfileCompletenessCard(percentage: 83),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Recent Shipments',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        const Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff454743),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ShipmentCard(
                          shipment: Shipment(
                            name: 'Fish',
                            address: 'CMD road, Magodo, Lagos',
                            status: ShipmentStatus.completed,
                            date: dateNow,
                          ),
                        ),

                        ShipmentCard(
                          shipment: Shipment(
                            name: 'Vegetables',
                            address: 'Chevron road, Lekki, Lagos',
                            status: ShipmentStatus.ongoing,
                            date: DateTime.now(),
                          ),
                        ),
                        const Text(
                          'Yesterday',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff454743),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ShipmentCard(
                              shipment: Shipment(
                                name: 'Plantains',
                                address: 'Allen Avenue, Ikeja, Lagos',
                                status: ShipmentStatus.completed,
                                date: dateYesterday,
                              ),
                            ),
                            ShipmentCard(
                              shipment: Shipment(
                                name: 'Vegetables',
                                address: 'Alausa, Ikeja, Lagos',
                                status: ShipmentStatus.completed,
                                date: dateYesterday,
                              ),
                            ),

                            ShipmentCard(
                              shipment: Shipment(
                                name: 'Grapes',
                                address: 'Alausa, Ikeja, Lagos',
                                status: ShipmentStatus.completed,
                                date: dateYesterday,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: SeeMoreButton(
                      onPressed: seeMoreButtonPressed,
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
