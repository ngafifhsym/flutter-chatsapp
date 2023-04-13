import 'package:chatapp/ui/auth/register/register_page.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcome-page';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bg_relief.png')
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/waletlogo.png',
                width: 300,
                height: 300,
              ),
              CustomButton(textButton: 'Get Started', onTap: (){
                Navigator.pushReplacementNamed(context, RegisterPage.routeName);
              })
            ],
          ),
        ),
      ),
    );
  }
}
