import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/RegisteredVehicles.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/profile_view_model.dart';
import 'package:rexofarm/widgets/text_with_header.dart';

class RegisteredVehiclePage extends StatelessWidget with AlertUtils {
  final RegisteredVehicle vehicle;

  const RegisteredVehiclePage({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${vehicle.make} ${vehicle.type}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 18, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextWithHeader(header: 'Vehicle Type', text: vehicle.type),
                TextWithHeader(header: 'Vehicle Make', text: vehicle.make),
                TextWithHeader(header: 'Vehicle Model', text: vehicle.model),
                const TextWithHeader(
                  header: 'Year of Make',
                  text: 'No defined',
                ),
                TextWithHeader(header: 'Number Plate', text: vehicle.plate),
                TextWithHeader(
                  header: 'Date Added',
                  text: DateFormat().add_yMMMMd().format(vehicle.createdAt),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: kLightRed,
                    foregroundColor: kDeepRed,
                    elevation: 0,
                  ),
                  onPressed: () async {
                    bool shouldDelete = await showCancelDialog(
                      context,
                      title: 'Delete Vehicle',
                      description:
                          'Are you sure you want to delete this vehicle ?',
                    );

                    if (shouldDelete && context.mounted) {
                      showLoadingAlert(context, text: 'Deleting vehicle: ${vehicle.make} ${vehicle.type}');

                      final response = await Provider.of<ProfileViewModel>(
                        context,
                        listen: false,
                      ).deleteVehicle(vehicle.id);

                      if (context.mounted) {
                        dismissLoader(context, rootNavigator: true);

                        if (response.status == ResponseStatus.completed) {
                          showSuccessSnackBar(
                            context,
                            title: '${vehicle.make} ${vehicle.type}',
                            categories: 'vehicles',
                          );

                          Provider.of<ProfileViewModel>(
                            context,
                            listen: false,
                          ).refreshData();

                          Navigator.pop(context);
                        } else if (response.status == ResponseStatus.error) {
                          showInfoSnackBar(
                            context,
                            description: response.message!,
                            type: AlertType.error,
                          );
                        }
                      }
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('images/profile/trash.png'),
                      const SizedBox(width: 8),
                      const Text('Delete Vehicle')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
