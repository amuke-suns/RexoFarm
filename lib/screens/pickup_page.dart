import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/pickup_requests.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/home_view_model.dart';
import 'package:rexofarm/widgets/delivery_card.dart';
import 'package:rexofarm/widgets/shimmer_widget.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({Key? key}) : super(key: key);

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pickup Requests'),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: kAppPrimaryColor,
            isScrollable: true,
            unselectedLabelColor: Colors.black26,
            indicatorColor: kAppPrimaryColor,
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('New Requests'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Accepted'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Completed'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Ongoing'),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<PickupRequest>>(
            future: Provider.of<HomeViewModel>(
              context,
              listen: false,
            ).getPickupRequests(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final data = snapshot.data ?? [];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return DeliveryCard(pickupRequest: data[index]);
                        },
                      ),
                      const Center(
                        child: Text('No accepted requests yet'),
                      ),
                      const Center(
                        child: Text('No completed requests yet'),
                      ),
                      const Center(
                        child: Text('No ongoing requests yet'),
                      ),
                    ],
                  ),
                );
              } else {
                return _buildShimmer();
              }
            }),
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => const ShimmerWidget(),
    );
  }
}
