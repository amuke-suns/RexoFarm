import 'package:flutter/material.dart';
import 'package:rexofarm/models/shipment_mock.dart';
import 'package:rexofarm/services/web_api/mock_api.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/widgets/shimmer_widget.dart';
import 'package:rexofarm/widgets/shipments_list_builder.dart';

class ShipmentPage extends StatefulWidget {
  const ShipmentPage({Key? key}) : super(key: key);

  @override
  State<ShipmentPage> createState() => _ShipmentPageState();
}

class _ShipmentPageState extends State<ShipmentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shipment',
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: kAppPrimaryColor,
            isScrollable: true,
            unselectedLabelColor: Colors.black26,
            indicatorColor: kAppPrimaryColor,
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('New Shipments'),
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
        body: FutureBuilder<List<Shipment>>(
            future: MockApi().getMockShipments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final data = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TabBarView(
                    children: [
                      ShipmentsListBuilder(data: data.getLatest()),
                      ShipmentsListBuilder(data: data.getAccepted()),
                      ShipmentsListBuilder(data: data.getCompleted()),
                      ShipmentsListBuilder(data: data.getOngoing()),
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
