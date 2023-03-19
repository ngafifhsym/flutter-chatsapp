import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
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
        ),
      ),
    );
  }
}