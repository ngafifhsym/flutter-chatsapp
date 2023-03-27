
import 'dart:io';

import 'package:chatapp/common/color_manager.dart';
import 'package:flutter/material.dart';

class UploadPhotoWidget extends StatelessWidget {
  const UploadPhotoWidget({Key? key, required this.image}) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: ColorManager.brown,
                  width: 8,
                  strokeAlign: BorderSide.strokeAlignOutside)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image != null ? Image(image: FileImage(image!), fit: BoxFit.cover,) : Image.asset('assets/images/empty_image.png', fit: BoxFit.cover,),
          ),
        ),
        Positioned(
          bottom: -25,
          child: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: RawMaterialButton(
                fillColor: ColorManager.secondaryColor,
                elevation: 2.0,
                padding: const EdgeInsets.all(8),
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
