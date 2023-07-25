import 'package:flutter/material.dart';
import 'package:rexofarm/layouts/upload_single_image_layout.dart';
import 'package:rexofarm/screens/kyc_upload/vehicle_details_page.dart';

class NinSlipPage extends StatelessWidget {
  const NinSlipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UploadSingleImageLayout(
      pageTitle: 'Upload Document',
      pageIndicatorCount: 1,
      imageTitle: 'Upload NIN Slip',
      imageDescription: 'Capture clear image of NIN slip.',
      onNextPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VehicleDetailsPage(),
          ),
        );
        // Add your logic here
      },
    );  }
}
