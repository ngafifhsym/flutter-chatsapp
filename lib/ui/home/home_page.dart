import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/slide_page_route.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/user_cubit.dart';
import 'package:chatapp/ui/message/message_page.dart';
import 'package:chatapp/widget/chat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Walchat'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                final filteredUsers = state.users.where((user) => user.username != 'beranju').toList();
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
              imageUrl: user.photoUrl,
              title: user.username,
              subtitle: user.about,
              onTap: () {
                Navigator.push(context, SlidePageRoute(child: MessagePage(user: user,)));
              }
              );
        });
  }
}
