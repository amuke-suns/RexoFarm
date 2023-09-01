import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/models/drivers_address.dart';
import 'package:rexofarm/models/next_of_kin.dart';
import 'package:rexofarm/models/vehicle.dart';
import 'package:rexofarm/services/web_api/kyc_api_impl.dart';

class KycViewModel extends ChangeNotifier {
  String? _id;

  Vehicle vehicle = Vehicle();

  DriversAddress driversAddress = DriversAddress();

  NextOfKin kin = NextOfKin();

  final ImagePicker _picker = ImagePicker();
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;

  File? get image1 => _image1;

  File? get image2 => _image2;

  File? get image3 => _image3;

  File? get image4 => _image4;

  File? _frontLicense;
  File? _backLicense;

  set frontLicense(File file) => _frontLicense = file;

  set backLicense(File file) => _backLicense = file;

  Future<ApiResponse> uploadNinImage({
    required File file,
    required String token,
  }) {
    return KycApiImpl().uploadNinImage(
      file,
      token,
    );
  }

  Future<ApiResponse> uploadVehicleDetails(String userToken) async {
    final response = await KycApiImpl().uploadVehicleDetails(
      userToken,
      vehicle,
    );

    if (response.status == ResponseStatus.completedWithData) {
      _id = response.data as String;
    }

    return response;
  }

  void getImagesFromDevice() async {
    final pickedMultiImages = await _picker.pickMultiImage();

    for (int i = 0; i < pickedMultiImages.length && i < 4; i++) {
      final pickedImage = pickedMultiImages[i];
      setImage(i, pickedImage);
    }

    if (pickedMultiImages.isNotEmpty) {
      notifyListeners();
    }
  }

  void getSingleImageFromDevice(int index) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage(index, pickedImage);
      notifyListeners();
    }
  }

  void setImage(int index, XFile pickedImage) {
    switch (index) {
      case 0:
        _image1 = File(pickedImage.path);
        break;
      case 1:
        _image2 = File(pickedImage.path);
        break;
      case 2:
        _image3 = File(pickedImage.path);
        break;
      case 3:
        _image4 = File(pickedImage.path);
        break;
    }
  }

  void removePickedImage(int imageIndex) {
    switch (imageIndex) {
      case 0:
        _image1 = null;
        break;
      case 1:
        _image2 = null;
        break;
      case 2:
        _image3 = null;
        break;
      case 3:
        _image4 = null;
        break;
    }
    notifyListeners();
  }

  bool isNoImageSelected() {
    return _image1 == null &&
        _image2 == null &&
        _image3 == null &&
        _image4 == null;
  }

  Future<ApiResponse> uploadVehicleImages({required String userToken}) async {
    List<File> uploadedImages = [];

    if (_image1 != null) uploadedImages.add(_image1!);
    if (_image2 != null) uploadedImages.add(_image2!);
    if (_image3 != null) uploadedImages.add(_image3!);
    if (_image4 != null) uploadedImages.add(_image4!);

    return KycApiImpl().uploadVehicleImages(
      token: userToken,
      vehicleId: _id!,
      files: uploadedImages,
    );
  }

  Future<ApiResponse> uploadLicenseImages({
    required String userToken,
    required File backLicenseImage,
  }) async {
    _backLicense = backLicenseImage;

    return KycApiImpl().uploadLicenseImages(
      token: userToken,
      files: [_frontLicense!, _backLicense!],
    );
  }

  Future<ApiResponse> uploadDriversProfile(String token) async {
    return KycApiImpl().uploadDriversProfile(
      token: token,
      state: driversAddress.state,
      city: driversAddress.city,
      address: driversAddress.address,
    );
  }

  Future<ApiResponse> uploadNextOfKinDetails(String token) async {
    return KycApiImpl().uploadNextOfKinDetails(token: token, kin: kin);
  }
}
