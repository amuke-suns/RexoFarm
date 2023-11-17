import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/models/api_response.dart';
import 'package:rexofarm/utilities/alert_utils.dart';
import 'package:rexofarm/utilities/navigation_utils.dart';
import 'package:rexofarm/validators.dart';
import 'package:rexofarm/view_models/change_password_view_model.dart';
import 'package:rexofarm/view_models/home_view_model.dart';
import 'package:rexofarm/widgets/input_field.dart';
import 'package:rexofarm/widgets/main_page_button.dart';

class ChangePasswordNewPage extends StatefulWidget {
  const ChangePasswordNewPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordNewPage> createState() => _ChangePasswordNewPageState();
}

class _ChangePasswordNewPageState extends State<ChangePasswordNewPage>
    with AlertUtils {
  final _formKey = GlobalKey<FormState>();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
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
                    const SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputField(
                            labelText: 'New password',
                            hintText: 'Enter a new password',
                            validator: Validators.validatePassword,
                            showToggle: true,
                            onSaved: (text) {
                              Provider.of<ChangePasswordViewModel>(
                                context,
                                listen: false,
                              ).newPassword = text!;
                            },
                            onChanged: (text) {
                              _password = text;
                            },
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            labelText: 'Confirm new password',
                            hintText: 'Re-enter the new password',
                            showToggle: true,
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
                      onPressed: () => changePassword(context),
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

  changePassword(BuildContext context) async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();
      showLoadingAlert(context,
          text: "Please wait while we change your password");
      final response = await Provider.of<ChangePasswordViewModel>(
        context,
        listen: false,
      ).changePassword(
        token: Provider.of<HomeViewModel>(
          context,
          listen: false,
        ).token!,
      );

      if (context.mounted) {
        dismissLoader(context, rootNavigator: true);

        if (response.status == ResponseStatus.completed) {
          showSuccessSnackBar(
            context,
            title: 'Password changed successfully',
          );
          Navigator.pop(context);
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
