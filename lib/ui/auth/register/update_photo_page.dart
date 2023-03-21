import 'package:chatapp/common/style_manager.dart';
import 'package:chatapp/ui/home/home_page.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:chatapp/widget/upload_photo_widget.dart';
import 'package:flutter/material.dart';

class UpdatePhotoPage extends StatelessWidget {
  static const String routeName = '/update-photo';
  const UpdatePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30.0),
          child: Column(
            children: [
              const UploadPhotoWidget(image: null),
              const SizedBox(height: 300,),
              CustomButton(textButton: "Update", onTap: (){
                Navigator.pushNamed(context, HomePage.routeName);
              }),
              TextButton(onPressed: (){}, child: Text('Skip', style: getWhite14RegularTextStyle(),))
            ],
          ),
        ),
      ),
    );
  }
}
