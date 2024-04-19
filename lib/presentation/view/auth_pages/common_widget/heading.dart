import 'package:flutter/material.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title_image.dart';

class Heading extends StatelessWidget {
    final String heading;
  final String imageUrl;
  const Heading({
    super.key,
        required this.heading,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MainTitle(heading: heading),
        TitleImage(imageUrl: imageUrl)
      ],
    );
  }
}
