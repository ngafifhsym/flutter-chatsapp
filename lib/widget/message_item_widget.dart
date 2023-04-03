import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/utils/date_utils.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Align(
        alignment:
            message.sender == 'joko' ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: message.sender == 'joko' ? const EdgeInsets.only(left: 60) : const EdgeInsets.only(right: 60),
          decoration: BoxDecoration(
              borderRadius: message.sender == 'joko'
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))
                  : const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
              color: message.sender == 'joko'
                  ? Colors.white
                  : ColorManager.secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.message,
                maxLines: 4,
                textAlign: message.sender == 'joko' ? TextAlign.end : TextAlign.start,
                style: message.sender == 'joko' ? getPrimary14RegularTextStyle() : getWhite14RegularTextStyle(),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                dateFormatter(message.dateTime),
                textAlign: message.sender == 'joko'? TextAlign.start : TextAlign.end,
                style: message.sender == 'joko' ? getPrimary14RegularTextStyle() : getWhite14RegularTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
