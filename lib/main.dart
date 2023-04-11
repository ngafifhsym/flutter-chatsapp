import 'package:chatapp/common/slide_page_route.dart';
import 'package:chatapp/common/theme_data_manager.dart';
import 'package:chatapp/data/cubit/message_cubit.dart';
import 'package:chatapp/data/cubit/user_cubit.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/ui/auth/login/login_screen.dart';
import 'package:chatapp/ui/auth/register/register_page.dart';
import 'package:chatapp/ui/auth/register/update_photo_page.dart';
import 'package:chatapp/ui/auth/welcome_page.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:chatapp/ui/profile/profile_page.dart';
import 'package:chatapp/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit()..fetchUsers(),
        ),
        BlocProvider(create: (context) => MessageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getThemeData(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomePage.routeName: (context) => const HomePage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          UpdatePhotoPage.routeName: (context) => const UpdatePhotoPage(),
          WelcomePage.routeName: (context) => const WelcomePage(),
          // MessagePage.routeName: (context) => const MessagePage(),
          LoginPage.routeName: (context) => const LoginPage(),
          ProfilePage.routeName : (context) => const ProfilePage(),
        },
      ),
    );
  }
}
