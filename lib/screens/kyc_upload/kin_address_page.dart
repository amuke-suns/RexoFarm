import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';
import 'package:rexofarm/widgets/form_header_card.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/validators.dart';

import '../../widgets/nigeria_state_dropdown.dart';
import 'package:rexofarm/view_models/nigeria_states.dart';

class NextOfKinAddressPage extends StatelessWidget with AlertUtils {
  final _formKey = GlobalKey<FormState>();

  NextOfKinAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NigeriaState? selectedNigeriaState;
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
                    FormHeaderCard(
                      title: 'Update Profile',
                      subtitle: 'Next of Kin\'s Address',
                      pageIndicatorCount: 2,
                      totalIndicators: 3,
                    ),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            NigeriaStateDropdown(
                              labelText: 'State of Residence',
                              onChanged: (selectedState) {
                                setState(() {
                                  selectedNigeriaState = selectedState;
                                });
                              },
                              value: selectedNigeriaState,
                              hintText: 'Select your State of Residence',
                              // Customize the decoration properties here
                            ),
                            const SizedBox(height: 16),
                            InputField(
                              labelText: 'City',
                              onSaved: (value) {
                                Provider.of<KycViewModel>(
                                  context,
                                  listen: false,
                                ).kin.city = value!;
                              },
                              validator: Validators.validateCity,
                              hintText: 'Enter your city',
                            ),
                            const SizedBox(height: 16),
                            InputField(
                              labelText: 'Home Address',
                              onSaved: (value) {
                                Provider.of<KycViewModel>(
                                  context,
                                  listen: false,
                                ).kin.address = value!;
                              },
                              validator: Validators.validateHomeAddress,
                              hintText: 'Enter your home address',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => onProceedPressed(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 19),
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
                    Center(
                      child: TextButton(
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

  onProceedPressed(BuildContext context) async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();

      showLoadingAlert(context, text: 'Uploading Next of Kin\'s Profile');

      String token = Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).userToken!;

      final response = await Provider.of<KycViewModel>(
        context,
        listen: false,
      ).uploadNextOfKinDetails(token);

      if (context.mounted) {
        dismissLoader(context);

        if (response.status == ResponseStatus.completed) {
          NavigationUtils.clearStackAndHome(context);
        } else {
          showMessageAlert(
            context,
            title: 'Error occurred!',
            body: response.message!,
          );
        }
      }
    }
  }

  void setState(Null Function() param0) {}
}
