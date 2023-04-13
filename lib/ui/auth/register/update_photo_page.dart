import 'dart:io';

import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/auth_cubit.dart';
import 'package:chatapp/ui/auth/login/login_screen.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/color_manager.dart';

class UpdatePhotoPage extends StatefulWidget {
  static const String routeName = '/update-photo';

  const UpdatePhotoPage({Key? key}) : super(key: key);

  @override
  State<UpdatePhotoPage> createState() => _UpdatePhotoPageState();
}

class _UpdatePhotoPageState extends State<UpdatePhotoPage> {
  bool isLoading = false;
  File? imageFile;

  Widget uploadPhoto(File? image) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: ColorManager.brown,
                  width: 8,
                  strokeAlign: BorderSide.strokeAlignOutside)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image != null
                ? Image(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/empty_image.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: RawMaterialButton(
                fillColor: ColorManager.secondaryColor,
                elevation: 2.0,
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  selectImg();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 30.0),
              child: Column(
                children: [
                  uploadPhoto(imageFile),
                  const SizedBox(
                    height: 300,
                  ),
                  Stack(children: [
                    CustomButton(
                        textButton: "Update",
                        onTap: () {
                          if (imageFile != null && dataUser != null) {
                            context
                                .read<AuthCubit>()
                                .uploadPhoto(imageFile!, dataUser.uid);
                            Navigator.pushNamed(context, LoginPage.routeName);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select an image')));
                          }
                        }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Visibility(
                          visible: isLoading,
                          child: Container(
                              height: 24,
                              width: 24,
                              margin: const EdgeInsets.all(15),
                              child: const CircularProgressIndicator())),
                    )
                  ]),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Text(
                        'Skip',
                        style: getWhite14RegularTextStyle(),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void selectImg() async {
    final imagePicked = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);
    setState(() {
      imageFile = imagePicked != null ? File(imagePicked.path) : null;
    });
  }
}
