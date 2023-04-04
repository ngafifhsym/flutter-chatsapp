import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common/color_manager.dart';
import '../common/style_manager.dart';

class CustomChatTextField extends StatelessWidget {
  const CustomChatTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              _showPopupMenu(context);
            },
            icon: const Icon(
              Icons.attach_file,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: TextField(
              maxLines: 5,
              minLines: 1,
              style: getWhite14RegularTextStyle(),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: getWhite14RegularTextStyle(),
                  filled: true,
                  border: InputBorder.none),
            ),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final size = MediaQuery.of(context).size;
    await showMenu(
      context: context,
      color: ColorManager.secondaryColor,
      position: RelativeRect.fromLTRB(10, size.height, size.width, 100),
      items: [
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: () {
              selectImage(ImageSource.gallery);
            },
            icon: const Icon(Icons.image),
            label: Text(
              'Image',
              style: getWhite14RegularTextStyle(),
            ),
          ),
        ),
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: () {
              selectFile();
            },
            icon: const Icon(Icons.file_present_sharp),
            label: Text(
              'File',
              style: getWhite14RegularTextStyle(),
            ),
          ),
        ),
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: () {
              selectVideo(ImageSource.gallery);
            },
            icon: const Icon(Icons.video_collection),
            label: Text(
              'Video',
              style: getWhite14RegularTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Future<XFile?> selectImage(ImageSource source) async {
    final image = await ImagePicker()
        .pickImage(source: source, maxHeight: 1800, maxWidth: 1800);
    return image;
  }

  Future<XFile?> selectVideo(ImageSource source) async {
    final video = await ImagePicker().pickVideo(source: source);
    return video;
  }

  Future<List<XFile>?> selectFile() async {
    List<XFile>? file;
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    file =  result?.paths.map((e) => XFile(e!)).toList();
    return file;
  }
}
