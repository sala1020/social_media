import 'package:flutter/material.dart';

class TitleImage extends StatelessWidget {
  final double? height;
  final double? width;
  const TitleImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.fill,
      height: height ?? 200,
      width: width ?? 150,
    );
  }
}
