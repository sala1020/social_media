import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/screens/auth_pages/splash/widgets/button.dart';

class Section3 extends StatelessWidget {
  const Section3({
    super.key,
  });

  final _text = '''                or   
   Create Account''';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SplashPageButton(
            buttonName: 'SIGN IN',
            height: 47,
          ),
          Text(
            _text,
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(175, 255, 255, 255)),
          ),
          const SplashPageButton(
            buttonName: 'SIGN UP',
            height: 47,
          )
        ],
      ),
    );
  }
}
