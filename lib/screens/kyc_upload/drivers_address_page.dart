import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/screens/kyc_upload/next_of_kin_page.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';
import 'package:rexofarm/widgets/form_header_card.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/validators.dart';

class DriverAddressPage extends StatelessWidget with AlertUtils {
  final _formKey = GlobalKey<FormState>();

  DriverAddressPage({Key? key}) : super(key: key);

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
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          FormHeaderCard(
                            title: 'Update Profile',
                            subtitle: 'Driver\'s Address',
                            pageIndicatorCount: 0,
                            totalIndicators: 3,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputField(
                                  labelText: 'State of Residence',
                                  onSaved: (value) {
                                    Provider.of<KycViewModel>(
                                      context,
                                      listen: false,
                                    ).driversAddress.state = value!;
                                  },
                                  validator: Validators.validateState,
                                  hintText: 'Enter your state of residence',
                                ),
                                const SizedBox(height: 16),
                                InputField(
                                  labelText: 'City',
                                  onSaved: (value) {
                                    Provider.of<KycViewModel>(
                                      context,
                                      listen: false,
                                    ).driversAddress.city = value!;
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
                                    ).driversAddress.address = value!;
                                  },
                                  validator: Validators.validateHomeAddress,
                                  hintText: 'Enter your home address',
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
                        onPressed: () => onUploadPressed(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 19),
                          backgroundColor: kAppPrimaryColor,
                        ),
                        child: const Text(
                          'Upload',
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

  onUploadPressed(BuildContext context) async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();

      showLoadingAlert(context, text: 'Uploading Profile');

      String token = Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).userToken!;

      final response = await Provider.of<KycViewModel>(
        context,
        listen: false,
      ).uploadDriversProfile(token);

      if (context.mounted) {
        dismissLoader(context);

        if (response.status == ResponseStatus.completed) {
          NavigationUtils.goTo(context, NextOfKinPage());
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
}
