import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common/color_manager.dart';
import '../common/style_manager.dart';

class CustomChatTextField extends StatelessWidget {
  const CustomChatTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                selectImage(ImageSource.gallery);
              },
              icon: const Icon(
                Icons.emoji_emotions_rounded,
                color: Colors.white,
              )),
          Flexible(
              child: TextField(
            maxLines: 5,
            minLines: 1,
            style: getWhite14RegularTextStyle(),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: getWhite14RegularTextStyle(),
                filled: true,
                border: InputBorder.none),
          )),
          IconButton(
              onPressed: () {
                _showPopupMenu(context);
              },
              icon: const Icon(
                Icons.attach_file,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final size = MediaQuery.of(context).size;
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(size.width, size.height, 10, 100),
        items: [
          PopupMenuItem(
              child: GestureDetector(
                onTap: (){
                  selectImage(ImageSource.gallery);
                },
                  child: const Text('Image')
              )
          ),
          PopupMenuItem(child: Text('File')),
          PopupMenuItem(child: Text('Video')),
        ],
        elevation: 1);
  }

  Future<XFile?> selectImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source, maxHeight: 1800, maxWidth: 1800);
    return image;
  }
}


