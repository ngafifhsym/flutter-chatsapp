import 'dart:io';

import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/auth_cubit.dart';
import 'package:chatapp/ui/auth/login/login_screen.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:chatapp/widget/upload_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePhotoPage extends StatelessWidget {
  static const String routeName = '/update-photo';

  const UpdatePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dataUser = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    void signUpUser(String name, String email, String password, File? imageUrl, String? about) {
      context.read<AuthCubit>().signUpWithEmail(name, email, password, imageUrl, about);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30.0),
          child: Column(
            children: [
              const UploadPhotoWidget(image: null),
              const SizedBox(
                height: 300,
              ),
              CustomButton(
                  textButton: "Update",
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  }),
              TextButton(
                  onPressed: () {
                    final name = dataUser['name'];
                    final email = dataUser['email'];
                    final password = dataUser['password'];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(name.toString())));
                    signUpUser(name!, email!, password!, null, null);
                    Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (routeName) => routeName.isFirst);
                  },
                  child: Text(
                    'Skip',
                    style: getWhite14RegularTextStyle(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
