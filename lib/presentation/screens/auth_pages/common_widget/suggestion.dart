
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/core/fonts/fonts.dart';

class suggestion extends StatelessWidget {
  final String maintext;
  final String tailText;
  const suggestion({
    super.key, required this.tailText, required this.maintext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          maintext,
          style: ksuggestion,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            tailText,
            style: GoogleFonts.inter(
                color: kWhite, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
