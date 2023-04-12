import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:chatapp/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Image(
                image: AssetImage("assets/images/waletlogo.png"),
                width: 200,
                height: 200,
              ),
            ),
            CustomTextField(
                labelName: 'Email',
                textHint: 'Masukkan email anda',
                controller: _emailController),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                labelName: 'Password',
                textHint: 'Password',
                controller: _passwordController),
            Container(
              width: 200,
              height: 45,
              margin: const EdgeInsets.only(top: 40, bottom: 50),
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: ColorManager.brown),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomePage.routeName);
                },
                child: Text("Masuk", style: getWhite16SemiBoldTextStyle()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun ?", style: getWhite12RegularTextStyle()),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        HomePage.routeName, (routeName) => routeName.isFirst);
                  },
                  child: Text(
                    "SignUp",
                    style: getWhite14RegularTextStyle(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
