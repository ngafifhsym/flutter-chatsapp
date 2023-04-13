import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/auth_cubit.dart';
import 'package:chatapp/ui/auth/register/register_page.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:chatapp/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/custom_button.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                    controller: _passwordController,
                    obSecure: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Stack(children: [
                    CustomButton(
                        textButton: "Masuk",
                        onTap: () {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          if (email.isNotEmpty && password.isNotEmpty) {
                            context
                                .read<AuthCubit>()
                                .loginWithEmail(email, password);
                            if (state is AuthSuccess) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomePage.routeName, (route) => route.isFirst);
                            }
                            if (state is AuthLoading) {
                              setState(() {
                                isLoading = !isLoading;
                              });
                            }
                            if (state is AuthFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)));
                            }
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
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum Punya Akun ?",
                          style: getWhite12RegularTextStyle()),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              RegisterPage.routeName,
                              (routeName) => routeName.isFirst);
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
          );
        },
      ),
    ));
  }
}
