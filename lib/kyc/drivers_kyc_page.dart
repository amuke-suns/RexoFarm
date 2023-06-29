import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Drivers/driver_details.dart';
import '../dashboard/dashboard.dart';

class DriverKycPage extends StatefulWidget {
  const DriverKycPage({Key? key}) : super(key: key);

  @override
  _DriverKycPageState createState() => _DriverKycPageState();
}

class _DriverKycPageState extends State<DriverKycPage> {

  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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
                    'Upload Document',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                
                Container(
                height: 8,
                width: 46,
                margin: const EdgeInsets.only(left: 100, top: 0, right: 100, bottom: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: SmoothPageIndicator(
                    count: 2,
                    controller: _controller,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 8,
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xFF006E21),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 0, left: 0, bottom: 16, right: 245),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0)),
                      child: const Text(
                        'Upload NIN Slip',
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    DottedBorder(
                      color: const Color.fromRGBO(0, 110, 33, 1),
                      strokeWidth: 1,
                      dashPattern: const [25, 20],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      child: InkWell(
                        onTap: getImage,
                        child: Container(
                          width: 358,
                          height: 200,
                          alignment: Alignment.center,
                          child: _image != null
                              ? Image.file(_image!)
                              : Image.asset(
                                  'images/Group.png',
                                  width: 208.36,
                                  height: 170,
                                  color: Colors.grey[400],
                                ),
                        ),
                      ),
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
                            'Capture clear image of NIN slip.',
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
                const SizedBox(height: 185),
                Container(
                  height: 53,
                  width: 358,
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                     context,
                     MaterialPageRoute(
                      builder: (
                        context) => DriverDetailsScreen()),
                   );
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 19, 40, 19),
                      backgroundColor: const Color.fromRGBO(0, 110, 33, 1),
                    ),
                    child: const Text('Proceed',
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
                    builder: (context) => const DashboardScreen()),
                 );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:  Color.fromRGBO(0, 110, 33, 1),
                ),
              ),
            ),
          ),
              ],
            ),
        ),
      ),
    );
  }
}