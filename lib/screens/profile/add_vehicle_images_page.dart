import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/profile_view_model.dart';

class AddVehicleImagesPage extends StatefulWidget {
  final String vehicleId;

  const AddVehicleImagesPage({
    Key? key,
    required this.vehicleId,
  }) : super(key: key);

  @override
  State<AddVehicleImagesPage> createState() => _AddVehicleImagesPageState();
}

class _AddVehicleImagesPageState extends State<AddVehicleImagesPage>
    with AlertUtils {
  final PageController _controller = PageController(initialPage: 0);

  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;

  bool _toUpload = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();

  Future getImage(int imageIndex) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _toUpload = true;
        });
        switch (imageIndex) {
          case 1:
            _image1 = File(pickedFile.path);
            break;
          case 2:
            _image2 = File(pickedFile.path);
            break;
          case 3:
            _image3 = File(pickedFile.path);
            break;
          case 4:
            _image4 = File(pickedFile.path);
            break;
        }
      }
    });
  }

  void removeImage(int imageIndex) {
    setState(() {
      switch (imageIndex) {
        case 1:
          _image1 = null;
          break;
        case 2:
          _image2 = null;
          break;
        case 3:
          _image3 = null;
          break;
        case 4:
          _image4 = null;
          break;
      }
      if (_image1 == null &&
          _image2 == null &&
          _image3 == null &&
          _image4 == null) {
        setState(() {
          _toUpload = false;
        });
      }
    });
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
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void onUploadButtonPressed(BuildContext context) async {
    showLoadingAlert(context, text: 'Uploading images');
    List<File> files = [];

    if (_image1 != null) files.add(_image1!);
    if (_image2 != null) files.add(_image2!);
    if (_image3 != null) files.add(_image3!);
    if (_image4 != null) files.add(_image4!);

    if (files.isNotEmpty) {

      final response = await Provider.of<ProfileViewModel>(
        context,
        listen: false,
      ).uploadVehicleImages(
        files: files,
      );

      if (context.mounted) {
        dismissLoader(context, rootNavigator: true);

        if (response.status == ResponseStatus.completed) {
          Provider.of<ProfileViewModel>(
            context,
            listen: false,
          ).refreshData();

          Navigator.pop(context);
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => getImage(1),
                                child: buildImagePreview(_image1, 1),
                              ),
                              InkWell(
                                onTap: () => getImage(2),
                                child: buildImagePreview(_image2, 2),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => getImage(3),
                                child: buildImagePreview(_image3, 3),
                              ),
                              InkWell(
                                onTap: () => getImage(4),
                                child: buildImagePreview(_image4, 4),
                              ),
                            ],
                          ),
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
                        onPressed: _toUpload
                            ? () => onUploadButtonPressed(context) : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: kAppPrimaryColor,
                        ),
                        child: const Text(
                          'Upload',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
