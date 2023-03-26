import 'package:flutter/material.dart';
import 'package:petscareclient/src/screens/doctors_screen.dart';

import '../sign_in.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/register_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets Care',
      initialRoute: '/onboarding',
      routes: {
        '/': (context) => const HomeScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) =>  const SignInScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}