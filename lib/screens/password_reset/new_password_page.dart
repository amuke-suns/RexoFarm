import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/screens/password_reset/password_success_page.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/view_models/reset_password_view_model.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/widgets/main_page_button.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> with AlertUtils {
  final _formKey = GlobalKey<FormState>();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset('images/reset_password/fingerprint.png'),
                    const SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputField(
                            labelText: 'New password',
                            hintText: 'Enter a new password',
                            validator: Validators.validatePassword,
                            onSaved: (text) {
                              Provider.of<ResetPasswordViewModel>(
                                context,
                                listen: false,
                              ).password = text!;
                            },
                            onChanged: (text) {
                              _password = text;
                            },
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            labelText: 'Confirm new password',
                            hintText: 'Re-enter the new password',
                            validator: (text) {
                              if (text?.isEmpty ?? true) {
                                return 'Please enter a password';
                              }
                              if (text != _password) {
                                return "Password does not match";
                              }
                              return null;
                            },
                            onSaved: (text) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    MainPageButton(
                      label: 'Proceed',
                      onPressed: () => resetComplete(context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  resetComplete(BuildContext context) async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();
      showLoadingAlert(context, text: "Changing the password");
      final response = await Provider.of<ResetPasswordViewModel>(
        context,
        listen: false,
      ).complete();

      if (context.mounted) {
        dismissLoader(context);

        if (response.status == ResponseStatus.completed) {
          NavigationUtils.clearStackTillFirstAndGoTo(
            context,
            const PasswordSuccessPage(),
          );
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
