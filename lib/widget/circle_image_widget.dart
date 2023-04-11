import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  static const String image = 'assets/images/empty_image.png';
  final String networkImage;
  final String assetsImage;
  final double height;
  final double width;

  const CircleImageWidget(
      {Key? key,
      required this.networkImage,
      this.assetsImage = image,
      this.height = 40,
      this.width = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          networkImage,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: Image.asset(assetsImage),
            );
          },
          errorBuilder: (context, error, stacktrace) {
            return Image.asset(assetsImage);
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
