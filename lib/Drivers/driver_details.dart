import 'package:flutter/material.dart';
import 'package:rexofarm/Drivers/vehicle_kyc.dart';
import 'package:rexofarm/inputs/input_field.dart';
import 'package:rexofarm/validators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../dashboard/dashboard.dart';


class DriverDetailsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController numberPlateController = TextEditingController();

  DriverDetailsScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 68, left: 0, right: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: const Text(
                  'Upload Vehicle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 8,
                width: 46,
                margin: const EdgeInsets.only(left: 150, top: 8, right: 150),
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
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Vehicle Details',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.071,
                    letterSpacing: 0,
                  ),
                ),
              ),
              const SizedBox(height: 43),
              SingleChildScrollView(
                child: Container(
                  
                  margin: const EdgeInsets.only(left: 16, right: 16),

                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputField(
                          labelText: 'Vehicle Type',
                          controller: vehicleTypeController,
                          validator: Validators.validateVehicleType,
                          placeholderText: 'Enter your vehicle type',
                        ),
                        const SizedBox(height: 16),
                        InputField(
                          labelText: 'Vehicle Make',
                          controller: vehicleTypeController,
                          validator: Validators.validateVehicleType,
                          placeholderText: 'Ford',
                        ),
                        const SizedBox(height: 16),
                        InputField(
                          labelText: 'Vehicle Model',
                          controller: vehicleTypeController,
                          validator: Validators.validateVehicleType,
                          placeholderText: 'Transit',
                        ),
                        const SizedBox(height: 16),
                        InputField(
                          labelText: 'Number Plate',
                          controller: numberPlateController,
                          validator: Validators.validateNumberPlate,
                          placeholderText: 'ABC-123-XYZ',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 130),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehicleKycPage(),
                        ),
                      );
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromRGBO(0, 110, 33, 1),
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
            ],
          ),
        ),
      ),
    );
  }
}
