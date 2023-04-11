import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/widget/circle_image_widget.dart';
import 'package:flutter/material.dart';

import '../common/color_manager.dart';

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ChatItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        onTap: onTap,
        textColor: Colors.white,
        title: Text(title),
        subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
        leading: Hero(
            tag: title,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(title, style: getWhite14RegularTextStyle(),),
                    backgroundColor: ColorManager.primaryColor,
                    content: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  ),
                );
              },
              child: CircleImageWidget(
                networkImage: imageUrl,
              ),
            )),
      ),
    );
  }
}
