import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/slide_page_route.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/auth_cubit.dart';
import 'package:chatapp/data/cubit/user_cubit.dart';
import 'package:chatapp/ui/auth/login/login_screen.dart';
import 'package:chatapp/ui/message/message_page.dart';
import 'package:chatapp/widget/chat_item_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/model/chat_user.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<UserCubit>().fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Walchat ${user?.displayName}'),
        actions: [
          IconButton(
              onPressed: showPopUpMenu,
              icon: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
              ))
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: ColorManager.secondaryColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is UserSuccess) {
              final filteredUsers = state.users
                  .where((user) => user.username != 'farizqi')
                  .toList();
              return listChat(filteredUsers);
            }
            if (state is UserFailed) {
              return Center(
                child: Text(
                  'Something went wrong!',
                  style: getWhite14RegularTextStyle(),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget listChat(List<ChatUser> users) {
    return ListView.builder(
        itemCount: users.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final user = users[index];
          return ChatItem(
              imageUrl: user.photoUrl.toString(),
              title: user.username.toString(),
              subtitle: user.about.toString(),
              onTap: () {
                Navigator.push(
                    context,
                    SlidePageRoute(
                        child: MessagePage(
                      user: user,
                    )));
              });
        });
  }

  void showPopUpMenu() => showMenu(
          context: context,
          color: ColorManager.secondaryColor,
          position: const RelativeRect.fromLTRB(1000, 120, 0, 1000),
          items: [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Settings',
                  style: getWhite14RegularTextStyle(),
                ),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                  if (FirebaseAuth.instance.currentUser == null){
                    Navigator.pushNamed(context, LoginPage.routeName);
                  }
                },
                child: Text(
                  'LogOut',
                  style: getWhite14RegularTextStyle(),
                ),
              ),
            ),
          ]);
}
