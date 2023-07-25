import 'package:flutter/material.dart';
import 'package:rexofarm/layouts/upload_single_image_layout.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NinSlipPage(),
          ),
        );
      },
    );
  }
}
