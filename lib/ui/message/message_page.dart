import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/chat_user.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:chatapp/widget/circle_image_widget.dart';
import 'package:chatapp/widget/current_message_item.dart';
import 'package:chatapp/widget/guest_message_item.dart';
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

    final dataUser = ModalRoute.of(context)?.settings.arguments as ChatUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20,),
        ),
        title: ListTile(
          leading: Hero(
            tag: dataUser.username,
            child: CircleImageWidget(networkImage: dataUser.photoUrl,),
          ),
          title: Text(dataUser.username, style: getWhite16SemiBoldTextStyle(),),
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
              child: ListView.builder(
            itemCount: dummyMessage.length,
            itemBuilder: (context, index) {
              bool isCurrent = dummyMessage[index].sender == 'joko';
              if (isCurrent) {
                return CurrentMessageItem(message: dummyMessage[index]);
              } else {
                return GuestMessageItem(message: dummyMessage[index]);
              }
            },
          )),
          const CustomChatTextField()
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
}
