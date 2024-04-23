import 'package:flutter/material.dart';
import 'package:social_media/presentation/view/auth_pages/signin_page/widgets/google_button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/suggestion.dart';

class Suggestions extends StatelessWidget {
  final String tailText;
  final String mainText;
  final Widget page;
  const Suggestions({super.key, required this.tailText, required this.mainText, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Suggestion(
          maintext: mainText,
          tailText: tailText,
          page:page ,
        ),
        const Divider(
          endIndent: 80,
          indent: 80,
          color: Colors.black45,
        ),
        const GoogleAuth()
      ],
    );
  }
}
