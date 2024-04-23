import 'package:flutter/material.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/heading.dart';

class SectionSignIn1 extends StatelessWidget {
 
  const SectionSignIn1({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(166, 255, 193, 7),
      alignment: Alignment.bottomCenter,
      height: 320,
      width: double.infinity,
      child: const Heading(
        heading:'Welcome\nBack Buddy' ,
        imageUrl: 'assets/og.png',
      ),
    );
  }
}
