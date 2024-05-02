import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';

class BgContainer extends StatelessWidget {
  const BgContainer({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..translate(0.0, 5.0),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kBg,
          boxShadow: const [
            BoxShadow(
              color: kBg,
              offset: Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(imageUrl!),
                  fit: BoxFit.cover,
                ),
              )
            : null);
  }
}
