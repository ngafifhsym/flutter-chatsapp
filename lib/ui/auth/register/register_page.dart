import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:chatapp/widget/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register-page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    // ** dispose controller to avoid memory leaks
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                    'assets/images/waletlogo.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(height: 30,),
                CustomTextField(labelName: "Nama", textHint: "Masukkan Nama Kamu", controller: nameController),
                const SizedBox(height: 16,),
                CustomTextField(labelName: "Email", textHint: "Masukkan Email Kamu", controller: emailController),
                const SizedBox(height: 16,),
                CustomTextField(labelName: "Password", textHint: "Masukkan Password Kamu", controller: passwordController, obSecure: true,),
                const SizedBox(height: 50,),
                CustomButton(textButton: "Daftar", onTap: (){}),
                const SizedBox(height: 16,),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: 'Sudah Punya Akun? ', style: getWhite14RegularTextStyle()),
                    TextSpan(text: 'Login', style: getWhite16SemiBoldTextStyle(), recognizer: TapGestureRecognizer()..onTap = (){ })
                  ]
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
