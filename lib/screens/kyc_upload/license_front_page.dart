// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rexofarm/layouts/upload_single_image_layout.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
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
    );
  }
}
