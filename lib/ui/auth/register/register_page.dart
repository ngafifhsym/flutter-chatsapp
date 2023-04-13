import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/ui/auth/login/login_screen.dart';
import 'package:chatapp/ui/auth/register/update_photo_page.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:chatapp/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../data/cubit/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register-page';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var logger = Logger();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  bool isLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  logger.d('Register Success');
                  Navigator.pushReplacementNamed(
                    context,
                    UpdatePhotoPage.routeName,
                  );
                }
                if (state is AuthFailed) {
                  logger.e(state.error);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Something went wrong!',
                      style: getWhite14RegularTextStyle(),
                    ),
                    backgroundColor: ColorManager.secondaryColor,
                  ));
                }
                if (state is AuthLoading) {
                  logger.i('loading...');
                  isLoading = !isLoading;
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Image.asset(
                      'assets/images/waletlogo.png',
                      width: 160,
                      height: 160,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        labelName: "Nama",
                        textHint: "Masukkan Nama Kamu",
                        controller: nameController),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        labelName: "Email",
                        textHint: "Masukkan Email Kamu",
                        controller: emailController),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      labelName: "Password",
                      textHint: "Masukkan Password Kamu",
                      controller: passwordController,
                      obSecure: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        CustomButton(
                          textButton: "Daftar",
                          onTap: () {
                            final name = nameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            if (name.isNotEmpty &&
                                email.isNotEmpty &&
                                password.isNotEmpty) {
                              context
                                  .read<AuthCubit>()
                                  .signUpWithEmail(name, email, password, null);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Field tidak boleh kosong',
                                  style: getWhite14RegularTextStyle(),
                                ),
                                backgroundColor: ColorManager.secondaryColor,
                              ));
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Visibility(
                            visible: isLoading,
                            child: Container(
                              height: 24,
                              width: 24,
                              margin: const EdgeInsets.all(15),
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun?',
                          style: getWhite12RegularTextStyle(),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          child: Text(
                            'Login',
                            style: getWhite14RegularTextStyle(),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
