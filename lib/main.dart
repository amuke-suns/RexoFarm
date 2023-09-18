import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/screens/auth/create_acct.dart';
import 'package:rexofarm/screens/auth/login_page.dart';
import 'package:rexofarm/screens/home.dart';
import 'package:rexofarm/screens/onboarding/onboarding_page.dart';
import 'package:rexofarm/services/storage/secure_storage.dart';
import 'package:rexofarm/services/storage/storage_service.dart';
import 'package:rexofarm/theme.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';
import 'package:rexofarm/view_models/home_view_model.dart';
import 'package:rexofarm/view_models/kyc_view_model.dart';
import 'package:rexofarm/view_models/profile_view_model.dart';
import 'package:rexofarm/view_models/reset_password_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<bool> onBoardingFuture = StorageServiceImpl().showOnBoarding();

  runApp(
    FutureBuilder<bool>(
      future: onBoardingFuture,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RexoFarmApp(showOnBoarding: snapshot.data!);
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'RexoFarm',
            home: Scaffold(),
          );
        }
      },
    ),
  );
}

class RexoFarmApp extends StatelessWidget {
  final bool showOnBoarding;
  final Future<String?> tokenFuture = SecureStorage().getActiveUserToken();

  RexoFarmApp({
    super.key,
    required this.showOnBoarding,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => KycViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RexoFarm',
        theme: RexoFarmAppTheme.light(),
        routes: {
          '/signUp': (context) => const CreateAccountPage(),
          '/login': (context) => const LoginPage(),
        },
        home: showOnBoarding
            ? const OnBoardingScreen()
            : FutureBuilder<String?>(
                future: tokenFuture,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String? token = snapshot.data;
                    if (token == null) {
                      return const CreateAccountPage();
                    } else {
                      print(token);
                      return Home(token: token);
                    }
                  } else {
                    return const MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'RexoFarm',
                      home: Scaffold(),
                    );
                  }
                },
              ),
      ),
    );
  }
}
