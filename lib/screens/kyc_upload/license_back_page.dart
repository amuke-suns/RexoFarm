import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/layouts/upload_single_image_layout.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';
import '../../view_models/auth_view_model.dart';
import 'nin_slip_page.dart';

class LicenseBackPage extends StatelessWidget {
  const LicenseBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UploadSingleImageLayout(
        pageTitle: 'Upload Document',
        pageIndicatorCount: 0,
        imageTitle: 'Upload Driver\'s License',
        imageDescription: 'Capture back image of driver\'s license.',
        onNextPressed: () {
          NavigationUtils.goTo(context, const NinSlipPage());
        },
        onUploadPressed: (File file) {
          String token = Provider.of<AuthViewModel>(
            context,
            listen: false,
          ).userToken!;

          return Provider.of<KycViewModel>(
            context,
            listen: false,
          ).uploadLicenseImages(
            userToken: token,
            backLicenseImage: file,
          );
        });
  }
}
