import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:chatapp/widget/circle_image_widget.dart';
import 'package:chatapp/widget/message_item_widget.dart';
import 'package:flutter/material.dart';

import '../../data/model/chat_user.dart';

class MessagePage extends StatefulWidget {
  static const String routeName = '/message-page';

  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)?.settings.arguments as ChatUser;

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
          leading: Hero(
            tag: userData.username,
            child: CircleImageWidget(networkImage: userData.photoUrl,),
          ),
          title: Text(userData.username, style: getWhite16SemiBoldTextStyle(),),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: dummyMessage.length,
            itemBuilder: (context, index) {
              return MessageItem(message: dummyMessage[index]);
            },
          )),
          const CustomChatTextField()
        ],
      ),
    );
  }
}
