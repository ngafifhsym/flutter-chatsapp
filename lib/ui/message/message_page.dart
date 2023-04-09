import 'dart:developer' as developer;

import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/message_cubit.dart';
import 'package:chatapp/data/model/chat_user.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:chatapp/widget/circle_image_widget.dart';
import 'package:chatapp/widget/current_message_item.dart';
import 'package:chatapp/widget/guest_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatefulWidget {
  static const String routeName = '/message-page';
  final ChatUser user;

  const MessagePage({Key? key, required this.user}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // ** temp variable
  final String currentUserId = 'farizqi@walmail.com';
  String groupChatId = '';

  @override
  void initState() {
    setLocal(widget.user);
    super.initState();
    context.read<MessageCubit>().fetchChatMessage(groupChatId);
  }

  void setLocal(ChatUser dataUser) {
    if (currentUserId.compareTo(dataUser.id) > 0) {
      groupChatId = '$currentUserId-${dataUser.id}';
      developer.log(groupChatId);
    } else {
      groupChatId = '${dataUser.id}-$currentUserId';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataUser = widget.user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: ListTile(
          leading: CircleImageWidget(
            networkImage: dataUser.photoUrl,
          ),
          title: Text(
            dataUser.username,
            style: getWhite16SemiBoldTextStyle(),
          ),
          subtitle: Text(groupChatId),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSettingPopupMenu(context);
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: groupChatId.isNotEmpty
                ? BlocBuilder<MessageCubit, MessageState>(
                    builder: (context, state) {
                      if (state is MessageSuccess) {
                        return listMessage(state.messages);
                      }
                      if (state is MessageLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is MessageFailed) {
                        developer.log(state.error);
                      }

                      return Container();
                    },
                  )
                : const Center(
                    child: Text('empty chat'),
                  ),
          ),
          CustomChatTextField(
            groupChatId: groupChatId,
            senderId: currentUserId,
            receiverId: dataUser.id,
          )
        ],
      ),
    );
  }

  void showSettingPopupMenu(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showMenu(
      context: context,
      color: ColorManager.secondaryColor,
      position: RelativeRect.fromLTRB(size.width, 92, 0, size.height),
      items: [
        PopupMenuItem(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Setting',
              style: getWhite14RegularTextStyle(),
            ),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Profile',
              style: getWhite14RegularTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Widget listMessage(List<ChatMessage> messages) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        bool isCurrent =
            message.senderId == 'farizqi@walmail.com' ? true : false;
        if (isCurrent) {
          return CurrentMessageItem(message: message);
        } else {
          return GuestMessageItem(message: message);
        }
      },
    );
  }
}
