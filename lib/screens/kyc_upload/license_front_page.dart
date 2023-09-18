import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/layouts/upload_single_image_layout.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';
import 'license_back_page.dart';

class LicenseFrontPage extends StatelessWidget {
  const LicenseFrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UploadSingleImageLayout(
        pageTitle: 'Upload Document',
        pageIndicatorCount: 0,
        imageTitle: 'Upload Driver\'s License',
        imageDescription: 'Capture front image of driver\'s license.',
        onNextPressed: () {
          NavigationUtils.goTo(context, const LicenseBackPage());
        },
        onUploadPressed: (File file) {
          Provider.of<KycViewModel>(context, listen: false).frontLicense = file;

          return ApiResponse.completed(token: null);
        });
  }
}
