import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/data/model/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile-page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _textController = TextEditingController();
  late User? currentUser;
  late bool isCurrentUser;

  @override
  void initState() {
    currentUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as ChatUser;
    if (currentUser != null){
      isCurrentUser = currentUser!.uid == user.id;
    }

    Widget dataItem(
        String title, String subTitle, IconData leading, Function() onPressed) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListTile(
          leading: FaIcon(
            leading,
            color: ColorManager.secondaryColor,
          ),
          title: Text(
            title,
            style: getWhite12RegularTextStyle().copyWith(color: Colors.grey),
          ),
          subtitle: Text(
            subTitle,
            overflow: TextOverflow.ellipsis,
            style: getWhite16SemiBoldTextStyle(),
          ),
          trailing: isCurrentUser
              ? IconButton(
                  onPressed: onPressed,
                  icon: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    color: ColorManager.brown,
                  ),
                )
              : const SizedBox(),
        ),
      );
    }

    void editUsername(String title) async {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: ColorManager.secondaryColor,
          title: Text(
            title,
            style: getWhite14RegularTextStyle(),
          ),
          content: SizedBox(
            width: double.infinity,
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorManager.brown)),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text(
                'Batal',
                style: getWhite14RegularTextStyle()
                    .copyWith(color: ColorManager.brown),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.brown),
                child: Text(
                  'Simpan',
                  style: getWhite14RegularTextStyle(),
                ))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username.toString()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                user.photoUrl != null
                    ? Hero(
                        tag: user.photoUrl.toString(),
                        child: Container(
                          width: 150,
                          height: 150,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(user.photoUrl.toString()))),
                        ),
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/empty_image.png'))),
                      ),
                dataItem('Username', user.username.toString(),
                    FontAwesomeIcons.userTie, () {
                  editUsername('Edit Username');
                }),
                dataItem('Email', user.about.toString(),
                    FontAwesomeIcons.envelope, () => null),
                dataItem('About', user.about.toString(),
                    FontAwesomeIcons.circleInfo, () => null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
