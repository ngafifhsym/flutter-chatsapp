import 'package:chatapp/common/theme_data_manager.dart';
import 'package:chatapp/ui/auth/register/register_page.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:chatapp/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getThemeData(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        HomePage.routeName : (context) => const HomePage(),
        RegisterPage.routeName : (context) => const RegisterPage()
      },
    );
  }
}
