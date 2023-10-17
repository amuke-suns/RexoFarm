import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/screens/profile/change_password_new_page.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/view_models/change_password_view_model.dart';
import 'package:rexofarm/view_models/home_view_model.dart';
import 'package:rexofarm/widgets/input_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> with AlertUtils {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ChangePasswordViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: InputField(
                        labelText:
                            'Please enter your password to confirm it’s you.',
                        hintText: 'Password',
                        validator: Validators.validatePassword,
                        showToggle: true,
                        onSaved: (value) {
                          model.currentPassword = value ?? '';
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                        side: const BorderSide(color: kAppPrimaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        final form = _formKey.currentState!;
                        if (form.validate()) {
                          form.save();

                          String email = Provider.of<HomeViewModel>(context, listen: false).driver!.email;

                          showLoadingAlert(context, text: 'Confirming password');

                          final isPasswordCorrect = await model.checkPasswordByLogin(email);
                          if (context.mounted) {
                            dismissLoader(context, rootNavigator: true);
                            if (isPasswordCorrect) {
                              NavigationUtils.replacePage(context, const ChangePasswordNewPage());
                            } else {
                              showMessageAlert(context, title: 'Failure', body: 'Password is incorrect');
                            }
                          }
                        }
                      },
                      child: const Text('Reset Password'),
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
}
