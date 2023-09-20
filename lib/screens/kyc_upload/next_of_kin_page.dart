import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';
import 'package:rexofarm/widgets/form_header_card.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/widgets/phone_input.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/widgets/gender_dropdown.dart';

import 'kin_address_page.dart';

class NextOfKinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  NextOfKinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gender? selectedGenderValue;

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
                      title: 'Upload Profile',
                      subtitle: 'Next of Kin',
                      pageIndicatorCount: 1,
                      totalIndicators: 3,
                    ),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: InputField(
                                    labelText: 'First Name',
                                    onSaved: (value) {
                                      Provider.of<KycViewModel>(
                                        context,
                                        listen: false,
                                      ).kin.firstName = value!;
                                    },
                                    validator: Validators.validateName,
                                    hintText: 'Enter your first name',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: InputField(
                                    labelText: 'Last Name',
                                    onSaved: (value) {
                                      Provider.of<KycViewModel>(
                                        context,
                                        listen: false,
                                      ).kin.lastName = value!;
                                    },
                                    validator: Validators.validateName,
                                    hintText: 'Enter your last name',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            GenderDropdown(
                              labelText: 'Gender',
                              onChanged: (selectedGender) {
                                selectedGenderValue = selectedGender;
                              },
                              value: selectedGenderValue,
                              hintText: 'Select a gender',
                            ),


                            const SizedBox(height: 16),
                            InputField(
                              labelText: 'Relationship',
                              onSaved: (value) {
                                Provider.of<KycViewModel>(
                                  context,
                                  listen: false,
                                ).kin.relationship = value!;
                              },
                              validator: Validators.validateRelationship,
                              hintText: 'Choose your relationship',
                            ),
                            const SizedBox(height: 16),
                            PhoneInput(
                              onPhoneNumberChanged: (phone) {
                                Provider.of<KycViewModel>(
                                  context,
                                  listen: false,
                                ).kin.phoneNumber = phone;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => onNextPressed(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 19),
                          backgroundColor: kAppPrimaryColor,
                        ),
                        child: const Text(
                          'Next',
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

  onNextPressed(BuildContext context) {
    final form = _formKey.currentState!;
    if (form.validate()) {
      // save the data to the view model
      form.save();

      NavigationUtils.goTo(context, NextOfKinAddressPage());
    }
  }
}
