import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/utils/date_utils.dart';
import 'package:flutter/material.dart';

class GuestMessageItem extends StatelessWidget {
  const GuestMessageItem({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.only(right: 60),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: ColorManager.secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.message,
                maxLines: 4,
                textAlign: TextAlign.start,
                style: getWhite14RegularTextStyle(),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                dateFormatter(message.timestamp),
                textAlign: TextAlign.end,
                style: getWhite10RegularTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
