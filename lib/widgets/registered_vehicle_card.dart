import 'package:flutter/material.dart';
import 'package:rexofarm/models/RegisteredVehicles.dart';
import 'package:rexofarm/screens/profile/registered_vehicle_page.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';

class RegisteredVehicleCard extends StatelessWidget {
  final RegisteredVehicle vehicle;

  const RegisteredVehicleCard({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('images/profile/group.png'),
      title: Text('${vehicle.make} ${vehicle.type}'),
      subtitle: Text(vehicle.plate),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'View Details',
            style: TextStyle(color: kAppPrimaryColor),
          ),
          Icon(
            Icons.navigate_next_outlined,
            size: 30,
          ),
        ],
      ),
      onTap: () {
        NavigationUtils.goTo(context, RegisteredVehiclePage(vehicle: vehicle));
      },
    );
  }
}
