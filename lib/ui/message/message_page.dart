import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:chatapp/widget/message_item_widget.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/empty_image.png',
              width: 35,
              height: 35,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Username',
              style: getWhite14RegularTextStyle(),
            )
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: dummyMessage.length,
            itemBuilder: (context, index){
              return MessageItem(message: dummyMessage[index]);
            },
          )),
          const CustomChatTextField()
        ],
      ),
    );
  }
}
