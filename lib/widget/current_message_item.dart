import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/message.dart';
import 'package:chatapp/utils/date_utils.dart';
import 'package:flutter/material.dart';

class CurrentMessageItem extends StatelessWidget {
  const CurrentMessageItem({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.only(left: 60),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.message,
                maxLines: 4,
                textAlign: TextAlign.end,
                style: getPrimary14RegularTextStyle(),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                dateFormatter(int.parse(message.timestamp)),
                textAlign: TextAlign.start,
                style: getPrimary10RegularTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
