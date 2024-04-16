
import 'package:flutter/material.dart';
import 'package:social_media/presentation/core/fonts/fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: kAuthFont,
    );
  }
}
