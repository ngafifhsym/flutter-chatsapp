import 'package:chatapp/data/cubit/message_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../common/color_manager.dart';
import '../common/style_manager.dart';

class CustomChatTextField extends StatefulWidget {
  final String groupChatId;
  final String senderId;
  final String receiverId;

  const CustomChatTextField(
      {Key? key,
      required this.groupChatId,
      required this.senderId,
      required this.receiverId})
      : super(key: key);

  @override
  State<CustomChatTextField> createState() => _CustomChatTextFieldState();
}

class _CustomChatTextFieldState extends State<CustomChatTextField> {
  final TextEditingController message = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    message.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
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
                  controller: message,
                  focusNode: _focusNode,
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
                  if (message.text.isNotEmpty) {
                    int date = DateTime.now().millisecondsSinceEpoch;
                    context.read<MessageCubit>().addMessage(
                        widget.groupChatId,
                        widget.senderId,
                        widget.receiverId,
                        message.text,
                        date.toString());
                    message.clear();
                    _focusNode.unfocus();
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
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
    file = result?.paths.map((e) => XFile(e!)).toList();
    return file;
  }
}
