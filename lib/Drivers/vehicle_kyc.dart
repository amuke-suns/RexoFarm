import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../dashboard/dashboard.dart';

import 'drivers_address.dart';

class VehicleKycPage extends StatefulWidget {
  const VehicleKycPage({Key? key}) : super(key: key);

  @override
  _VehicleKycPageState createState() => _VehicleKycPageState();
}

class _VehicleKycPageState extends State<VehicleKycPage> {
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;

  final PageController _controller = PageController(initialPage: 0);

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
      } else {
        print('No image selected.');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 68, left: 100, bottom: 32, right: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0)),
                child: const Text(
                  'Upload Vehicle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 0, left: 0, bottom: 16, right: 190),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0)),
                    child: const Text(
                      'Upload Vehicle image(s)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
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
                height: 48,
                width: 358,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFBCEBF1),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 16),
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
                      child: Center(
                        child: Text(
                          'You can upload up to 4 images of a vehicle',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F4D53),
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              Container(
                height: 53,
                width: 358,
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverAddressScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromRGBO(0, 110, 33, 1),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 110, 33, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}