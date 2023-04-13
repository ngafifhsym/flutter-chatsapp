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
              message.imageUrl != null
                  ? Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 6),
                      constraints: const BoxConstraints(maxHeight: 150),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(message.imageUrl!),
                        ),
                      ),
                    )
                  : const SizedBox(),
              message.message != null
                  ? Text(
                      message.message!,
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      style: getWhite14RegularTextStyle(),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 4,
              ),
              Text(
                dateFormatter(int.parse(message.timestamp)),
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
