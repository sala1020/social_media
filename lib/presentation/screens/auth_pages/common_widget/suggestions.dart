import 'package:flutter/material.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/widgets/google_button.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/suggestion.dart';

class Suggestions extends StatelessWidget {
  final String tailText;
  final String mainText;
  const Suggestions({super.key, required this.tailText, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        suggestion(
          maintext: mainText,
          tailText: tailText,
        ),
        const Divider(
          endIndent: 80,
          indent: 80,
        ),
        const GoogleAuth()
      ],
    );
  }
}
