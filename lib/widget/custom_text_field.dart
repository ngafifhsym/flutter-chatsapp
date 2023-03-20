import 'package:chatapp/common/color_manager.dart';
import 'package:chatapp/common/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.labelName,
      required this.textHint,
      required this.controller,
      this.obSecure = false})
      : super(key: key);

  final String labelName;
  final String textHint;
  final TextEditingController controller;
  final bool obSecure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhite12RegularTextStyle(),
        ),
        const SizedBox(height: 8.0,),
        TextField(
          controller: controller,
          obscureText: obSecure,
          style: getWhite12RegularTextStyle(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            filled: true,
            fillColor: ColorManager.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            hintText: textHint,
            hintStyle: getWhite12RegularTextStyle()
          ),
        )
      ],
    );
  }
}
