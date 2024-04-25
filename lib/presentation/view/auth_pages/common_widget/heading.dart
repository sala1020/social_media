import 'package:flutter/material.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title_image.dart';

class Heading extends StatelessWidget {
  final String heading;

  const Heading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return MainTitle(heading: heading);
  }
}
