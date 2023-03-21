import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ChatItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: Colors.white,
      title: Text(title),
      subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: const Text("10.00 PM"),
    );
  }
}
