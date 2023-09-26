import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/screens/password_reset/new_password_page.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/view_models/reset_password_view_model.dart';
import 'package:rexofarm/widgets/main_page_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with AlertUtils {

  @override
  void initState() {
    Provider.of<ResetPasswordViewModel>(
      context,
      listen: false,
    ).otp = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResetPasswordViewModel>(
      context,
      listen: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter One Time Password'),
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
                    Text.rich(
                      TextSpan(
                        text: 'Please enter the OTP sent to ',
                        children: [
                          TextSpan(
                            text: provider.email,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Pinput(
                      length: 6,
                      onChanged: (text) {
                        if (text.length != 6) {
                          provider.newOtp = null;
                        } else {
                          provider.newOtp = text;
                        }
                      },
                      defaultPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    TextButton(
                      onPressed: () {
                        NavigationUtils.goTo(context, const NewPasswordPage());
                      },
                      child: const Text('Resent OTP'),
                    ),
                    const SizedBox(height: 20),
                    MainPageButton(
                      label: 'Proceed',
                      onPressed: provider.otp == null
                          ? null
                          : () => validateReset(context),
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

  validateReset(BuildContext context) async {
    showLoadingAlert(context, text: 'Validating');

    final response = await Provider.of<ResetPasswordViewModel>(
      context,
      listen: false,
    ).validate();

    if (context.mounted) {
      dismissLoader(context);

      if (response.status == ResponseStatus.completed) {
        showInfoSnackBar(
          context,
          description: 'OTP validated successfully',
          type: AlertType.success,
        );
        NavigationUtils.goTo(context, const NewPasswordPage());
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
