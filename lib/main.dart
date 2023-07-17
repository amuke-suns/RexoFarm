import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexofarm/create_account/create_acct.dart';
import 'package:rexofarm/onboarding/onboarding_page.dart';
import 'package:rexofarm/services/storage/storage_service.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/view_models/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    FutureBuilder<bool>(
      future: StorageServiceImpl().showOnBoarding(),
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

  const RexoFarmApp({
    super.key,
    required this.showOnBoarding,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RexoFarm',
        theme: ThemeData(
          fontFamily: 'QuickSand',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: kAppPrimaryColor,
            secondary: kAppSecondaryColor,
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        home: showOnBoarding
            ? const OnBoardingScreen()
            : const CreateAccountPage(),
      ),
    );
  }
}
