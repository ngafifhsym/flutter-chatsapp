import 'dart:developer' as developer;
import 'dart:io';

import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/cubit/message_cubit.dart';
import 'package:chatapp/data/model/chat_user.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/ui/profile/profile_page.dart';
import 'package:chatapp/widget/circle_image_widget.dart';
import 'package:chatapp/widget/current_message_item.dart';
import 'package:chatapp/widget/guest_message_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MessagePage extends StatefulWidget {
  static const String routeName = '/message-page';
  final ChatUser user;

  const MessagePage({Key? key, required this.user}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late User? currentUser;
  File? imageFile;
  String groupChatId = '';

  @override
  void initState() {
    currentUser = FirebaseAuth.instance.currentUser;
    setLocal(widget.user);
    super.initState();
    context.read<MessageCubit>().fetchChatMessage(groupChatId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void setLocal(ChatUser dataUser) {
    if (currentUser != null){
      final uid = currentUser!.uid;
      if (uid.compareTo(dataUser.id) > 0) {
        groupChatId = '$uid-${dataUser.id}';
        developer.log(groupChatId);
      } else {
        groupChatId = '${dataUser.id}-$uid';
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    final dataUser = widget.user;

    // ** app bar
    PreferredSizeWidget appBar() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, ProfilePage.routeName, arguments: dataUser,);
          },
          child: ListTile(
            leading: Hero(
              tag: dataUser.photoUrl.toString(),
              child: CircleImageWidget(
                networkImage: dataUser.photoUrl.toString(),
              ),
            ),
            title: Text(
              dataUser.username.toString(),
              style: getWhite16SemiBoldTextStyle(),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSettingPopupMenu(context);
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      );
    }

    // ** list of message
    Widget listMessage(List<ChatMessage> messages) {
      return ListView.builder(
        itemCount: messages.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          final message = messages[index];
          bool isCurrent =
              message.senderId == currentUser?.uid ? true : false;
          if (isCurrent) {
            return CurrentMessageItem(message: message);
          } else {
            return GuestMessageItem(message: message);
          }
        },
      );
    }

    // ** text field for send message
    Widget textFieldMessage() {
      return Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Column(
          children: [
            imageFile != null
                ? Container(
                    width: double.infinity,
                    color: ColorManager.secondaryColor,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    constraints:
                        const BoxConstraints(minHeight: 0, maxHeight: 250),
                    child: GestureDetector(
                      onLongPress: (){
                        setState(() {
                          imageFile = null;
                        });
                      },
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _textEditingController,
                    focusNode: _focusNode,
                    maxLines: 5,
                    minLines: 1,
                    style: getWhite14RegularTextStyle(),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: getWhite14RegularTextStyle(),
                        filled: true,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            selectImage(ImageSource.gallery);
                          },
                        )),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty || imageFile != null ) {
                      if (currentUser != null){
                        final String date =
                        DateTime.now().millisecondsSinceEpoch.toString();
                        final chatId = groupChatId;
                        final senderId = currentUser!.uid;
                        final receiverId = dataUser.id;
                        final message = _textEditingController.text.isEmpty ? null : _textEditingController.text;
                        context.read<MessageCubit>().addMessage(
                            chatId, senderId, receiverId, date, message, imageFile);
                      }
                      imageFile = null;
                      _textEditingController.clear();
                      _focusNode.unfocus();
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Expanded(
            child: groupChatId.isNotEmpty
                ? BlocBuilder<MessageCubit, MessageState>(
                    builder: (context, state) {
                      if (state is MessageSuccess) {
                        scrollToLastChat();
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
                    child: Text('Something went wrong!'),
                  ),
          ),
          textFieldMessage(),
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

  void scrollToLastChat() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void selectImage(ImageSource source) async {
    final image = await ImagePicker()
        .pickImage(source: source, maxHeight: 1800, maxWidth: 1800);
    setState(() {
      imageFile = image != null ? File(image.path) : null;
    });
  }

  // Future<XFile?> selectVideo(ImageSource source) async {
  //   final video = await ImagePicker().pickVideo(source: source);
  //   return video;
  // }
  //
  // Future<List<XFile>?> selectFile() async {
  //   List<XFile>? file;
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //   file = result?.paths.map((e) => XFile(e!)).toList();
  //   return file;
  // }
}
