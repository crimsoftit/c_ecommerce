import 'package:duara_ecommerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:duara_ecommerce/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  // --- use this class to configure themes, initial bindings, animations, etc. ----
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
