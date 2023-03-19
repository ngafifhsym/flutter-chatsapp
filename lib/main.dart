import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  var faker = new Faker();
  List<Tab> myTab = [
    Tab(
      text: "Chats",
    ),
    Tab(
      text: "Whats New",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          backgroundColor: Color(0xFF111E27),
          appBar: AppBar(
            title: Text("Walchat"),
            backgroundColor: Color(0xFF202D36),
            bottom: TabBar(
              tabs: myTab,
              indicatorColor: Color(0xFF6D493A),
            ),
          ),
          body: TabBarView(children: [
             ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
           return ChatItem(
              imageUrl: "https://picsum.photos/id/$index/200/300",
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
              );
          },
        ),
            Center(
              child: Text("Text 2"),
            ),
        //  
          ])
        ),
      ),
    );
  }
}
class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ChatItem({
    super.key,
    required this.imageUrl, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: Colors.white,
      title: Text(title),
      subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
      trailing: Text("10.00 PM"),
      
    );
    }
    }
