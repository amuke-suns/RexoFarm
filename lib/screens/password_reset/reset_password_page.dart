import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/screens/password_reset/otp_page.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/view_models/reset_password_view_model.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/widgets/main_page_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> with AlertUtils {
  final _formKey = GlobalKey<FormState>();
  int tapIndex = 0;

  changeTapIndex(int index) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (index == 0 || index == 1) {
      if (index != tapIndex) {
        setState(() => tapIndex = index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'images/reset_password/reset_password_icon.png',
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 35),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => changeTapIndex(0),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 12, 8, 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: tapIndex == 0
                                      ? const Color(0xFFBCEBF1)
                                      : Colors.transparent,
                                ),
                                child: const Text(
                                  'Email address',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: null, //() => changeTapIndex(1),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 12, 8, 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: tapIndex == 1
                                      ? const Color(0xFFBCEBF1)
                                      : Colors.transparent,
                                ),
                                child: const Text(
                                  'Phone number',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputField(
                            labelText: '',
                            onSaved: (text) {
                              Provider.of<ResetPasswordViewModel>(
                                context,
                                listen: false,
                              ).email = text!;
                            },
                            validator: Validators.validateEmail,
                            hintText: 'Enter your email address',
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    MainPageButton(
                      label: 'Proceed',
                      onPressed: initiateReset,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  initiateReset() async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();
      showLoadingAlert(context, text: "Initializing");
      final response = await Provider.of<ResetPasswordViewModel>(
        context,
        listen: false,
      ).initiate();

      if (context.mounted) {
        dismissLoader(context);

        if (response.status == ResponseStatus.completed) {
          showInfoSnackBar(
            context,
            description: 'Initiated successfully',
            type: AlertType.success,
          );
          NavigationUtils.goTo(context, const OtpPage());
        } else {
          showInfoSnackBar(
            context,
            description: response.message!,
            type: AlertType.error,
          );
        }
      }
    }
  }
}
