import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/layouts/upload_single_image_layout.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/screens/kyc_upload/vehicle_details_page.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';

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
        NavigationUtils.goTo(
          context,
          VehicleDetailsPage(),
        );
      },
      onUploadPressed: (File file) async {
        String token = Provider.of<AuthViewModel>(
          context,
          listen: false,
        ).userToken!;

        return Provider.of<KycViewModel>(
          context,
          listen: false,
        ).uploadNinImage(file: file, token: token);
      },
    );
  }
}
