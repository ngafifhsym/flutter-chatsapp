import 'dart:async';

import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/service/user_service.dart';
import 'package:chatapp/ui/auth/register/register_page.dart';
import 'package:chatapp/ui/auth/welcome_page.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final timer = 5;
  final currentUser = UserService().auth.currentUser;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111E27),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/waletlogo.png'))),
            ),
            Text(
              'WalChat',
              style: getWhite24BoldTextStyle()),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  // ** this function use to set timer of splashscreen to navigate
  Future<Timer> _loadWidget() async {
    var duration = Duration(seconds: timer);
    return Timer(duration, () {
      if (currentUser != null){
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
      Navigator.pushReplacementNamed(context, WelcomePage.routeName);
    });
  }
}
