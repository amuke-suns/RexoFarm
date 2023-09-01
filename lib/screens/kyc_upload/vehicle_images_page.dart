import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';

import 'drivers_address_page.dart';

class VehicleImagesPage extends StatefulWidget {
  const VehicleImagesPage({Key? key}) : super(key: key);

  @override
  State<VehicleImagesPage> createState() => _VehicleImagesPageState();
}

class _VehicleImagesPageState extends State<VehicleImagesPage> with AlertUtils {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void removeImage(int imageIndex) {
    Provider.of<KycViewModel>(
      context,
      listen: false,
    ).removePickedImage(imageIndex);
  }

  Widget buildImagePreview(File? image, int imageIndex) {
    return Stack(
      children: [
        Container(
          width: 171,
          height: 139,
          padding: const EdgeInsets.only(left: 147, bottom: 119),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFF006E21),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            image: image != null
                ? DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: AssetImage('images/gallery-add.png'),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        if (image != null)
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: () => removeImage(imageIndex),
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: kDeepRed,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void onUploadButtonPressed(BuildContext context) async {
    final kycModel = Provider.of<KycViewModel>(context, listen: false);

    if (!kycModel.isNoImageSelected()) {
      showLoadingAlert(context, text: 'Uploading vehicle images');
      String token = Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).userToken!;

      final response = await kycModel.uploadVehicleImages(userToken: token);

      if (context.mounted) {
        dismissLoader(context);

        if (response.status == ResponseStatus.completed) {
          NavigationUtils.goTo(context, DriverAddressPage());
        } else {
          showMessageAlert(
            context,
            title: 'Error occurred',
            body: response.message!,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final kycModel = Provider.of<KycViewModel>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Upload Vehicle',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Upload Vehicle image(s)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          kycModel.isNoImageSelected()
                              ? showDottedBorder(context)
                              : _buildImagesGrid(kycModel),
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFBCEBF1),
                            ),
                            child: const Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color(0xFF1F4D53),
                                  child: Icon(
                                    Icons.error_rounded,
                                    color: Color(0xFFBCEBF1),
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'You can upload up to 4 images of a vehicle',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color(0xFF1F4D53),
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: kycModel.isNoImageSelected()
                            ? () => NavigationUtils.goTo(
                                context, DriverAddressPage())
                            : () => onUploadButtonPressed(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: kAppPrimaryColor,
                        ),
                        child: Text(
                          kycModel.isNoImageSelected() ? 'Next' : 'Upload',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        NavigationUtils.clearStackAndHome(context);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kAppPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildImagesGrid(KycViewModel kycModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => kycModel.getSingleImageFromDevice(0),
              child: buildImagePreview(kycModel.image1, 0),
            ),
            InkWell(
              onTap: () => kycModel.getSingleImageFromDevice(1),
              child: buildImagePreview(kycModel.image2, 1),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => kycModel.getSingleImageFromDevice(2),
              child: buildImagePreview(kycModel.image3, 2),
            ),
            InkWell(
              onTap: () => kycModel.getSingleImageFromDevice(3),
              child: buildImagePreview(kycModel.image4, 3),
            ),
          ],
        ),
      ],
    );
  }

  Widget showDottedBorder(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(0, 110, 33, 1),
      strokeWidth: 1,
      dashPattern: const [25, 20],
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      child: InkWell(
        onTap: () => Provider.of<KycViewModel>(context, listen: false)
            .getImagesFromDevice(),
        child: Container(
          width: double.infinity,
          height: 200,
          alignment: Alignment.center,
          child: Image.asset(
            'images/Group.png',
            width: 208.36,
            height: 170,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
