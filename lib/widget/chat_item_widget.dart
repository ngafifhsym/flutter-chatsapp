import 'package:chatapp/ui/message/message_page.dart';
import 'package:flutter/material.dart';

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
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/empty_image.png'),
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              imageErrorBuilder:(BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset('assets/images/empty_image.png');
              },
            ),
          ),
        ),
      ),
    );
  }
}
