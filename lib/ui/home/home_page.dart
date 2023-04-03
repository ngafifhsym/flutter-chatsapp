import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/ui/message/message_page.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../widget/chat_item_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = new Faker();
    List<Tab> myTab = [
      Tab(
        text: "Chats",
      ),
      Tab(
        text: "Whats New",
      )
    ];
    return Scaffold(
      body: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
            backgroundColor: ColorManager.primaryColor,
            appBar: AppBar(
              title: Text("Walchat"),
              backgroundColor: ColorManager.secondaryColor,
              bottom: TabBar(
                tabs: myTab,
                indicatorColor: ColorManager.brown,
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
                    onTap : (){
                      Navigator.pushNamed(context, MessagePage.routeName);
                    }
                  );
                },
              ),
              const Center(
                child: Text("Text 2"),
              ),
              //
            ])),
      ),
    );
  }
}

