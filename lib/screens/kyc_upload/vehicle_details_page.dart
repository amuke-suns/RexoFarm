import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/vehicle.dart';
import 'package:rexofarm/screens/kyc_upload/vehicle_images_page.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/validators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../home.dart';

class VehicleDetailsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController numberPlateController = TextEditingController();

  VehicleDetailsPage({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 1);

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
                          const SizedBox(height: 30),
                          Center(
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
                          const SizedBox(height: 30),
                          const Text(
                            'Vehicle Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              height: 1.071,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 36),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputField(
                                  labelText: 'Vehicle Type',
                                  controller: vehicleTypeController,
                                  validator: Validators.validateVehicleType,
                                  hintText: 'Enter your vehicle type',
                                ),
                                const SizedBox(height: 16),
                                InputField(
                                  labelText: 'Vehicle Make',
                                  controller: vehicleTypeController,
                                  validator: Validators.validateVehicleType,
                                  hintText: 'Ford',
                                ),
                                const SizedBox(height: 16),
                                InputField(
                                  labelText: 'Vehicle Model',
                                  controller: vehicleTypeController,
                                  validator: Validators.validateVehicleType,
                                  hintText: 'Transit',
                                ),
                                const SizedBox(height: 16),
                                InputField(
                                  labelText: 'Number Plate',
                                  controller: numberPlateController,
                                  validator: Validators.validateNumberPlate,
                                  hintText: 'ABC-123-XYZ',
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
                        onPressed: () {
                          /*Provider.of<AuthViewModel>(context, listen: false)
                              .uploadVehicleDetails(
                            Vehicle(
                              type: 'car',
                              make: 'toyota',
                              model: 'abc',
                              numberPlate: 'xyz',
                            ),
                          );*/
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VehicleKycPage(),
                            ),
                          );
                          // Add your logic here
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: kAppPrimaryColor,
                        ),
                        child: const Text(
                          'Proceed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
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
