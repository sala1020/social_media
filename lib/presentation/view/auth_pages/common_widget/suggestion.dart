
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';

class Suggestion extends StatelessWidget {
  final String maintext;
  final String tailText;
  final Widget page;
  const Suggestion({
    super.key, required this.tailText, required this.maintext, required this.page,
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
          onPressed: () {
            kPushNavigation(context: context, page:page);
          },
          child: Text(
            tailText,
            style: GoogleFonts.inter(
                color: kBlack, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
