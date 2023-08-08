import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UploadSingleImageLayout extends StatefulWidget {
  final String pageTitle;
  final int pageIndicatorCount;
  final String imageTitle;
  final String imageDescription;
  final Function() onNextPressed;
  final Function(File) onUploadPressed;

  const UploadSingleImageLayout({
    Key? key,
    required this.pageTitle,
    required this.pageIndicatorCount,
    required this.imageTitle,
    required this.imageDescription,
    required this.onNextPressed,
    required this.onUploadPressed,
  }) : super(key: key);

  @override
  State<UploadSingleImageLayout> createState() =>
      _UploadSingleImageLayoutState();
}

class _UploadSingleImageLayoutState extends State<UploadSingleImageLayout>
    with AlertUtils {
  late PageController _controller;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isImageSet = false;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.pageIndicatorCount);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _isImageSet = true;
      }
    });
  }

  Future<void> uploadImage(BuildContext context) async {
    showLoadingAlert(context, text: 'Uploading image');

    final response = await widget.onUploadPressed(_image!) as ApiResponse;

    if (context.mounted) {
      dismissLoader(context);

      if (response.status == ResponseStatus.completed) {
        showInfoSnackBar(
          context,
          description: 'Upload Successful',
          type: AlertType.success,
        );
        widget.onNextPressed();
      }

      if (response.status == ResponseStatus.error) {
        showInfoSnackBar(
          context,
          description: response.message!,
          type: AlertType.error,
        );
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
                          Text(
                            widget.pageTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),
                          SmoothPageIndicator(
                            count: 2,
                            controller: _controller,
                            axisDirection: Axis.horizontal,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 10,
                              dotHeight: 8,
                              dotColor: Colors.grey,
                              activeDotColor: kAppPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.imageTitle,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          DottedBorder(
                            color: const Color.fromRGBO(0, 110, 33, 1),
                            strokeWidth: 1,
                            dashPattern: const [25, 20],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            child: InkWell(
                              onTap: getImage,
                              child: Container(
                                width: double.infinity,
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
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFBCEBF1),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
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
                                    widget.imageDescription,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
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
                        onPressed:
                            _isImageSet ? () => uploadImage(context) : () => widget.onNextPressed(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.fromLTRB(40, 19, 40, 19),
                          backgroundColor: const Color.fromRGBO(0, 110, 33, 1),
                        ),
                        child: const Text('Upload'),
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
                          color: Color.fromRGBO(0, 110, 33, 1),
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
}
