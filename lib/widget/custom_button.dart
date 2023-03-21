import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.textButton, required this.onTap})
      : super(key: key);

  final String textButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: ColorManager.brown),
        child: Text(
          textButton,
          style: getWhite12RegularTextStyle(),
        ),
      ),
    );
  }
}
