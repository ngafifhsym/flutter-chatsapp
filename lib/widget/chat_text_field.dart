import 'package:flutter/material.dart';

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
          IconButton(onPressed: (){}, icon: const Icon(Icons.emoji_emotions_rounded, color: Colors.white,)),
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
                    border: InputBorder.none
                ),
              )
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.attach_file, color: Colors.white,))
        ],
      ),
    );
  }
}
