import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/core/size/heights.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/screens/auth_pages/signup_page/signup_page.dart';

class SectionSignIn2 extends StatelessWidget {
  const SectionSignIn2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(43, 255, 193, 7),
      height: 260,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const InputFieldAuth(
            hintText: 'Email Address',
          ),
          kHeight10,
          const InputFieldAuth(
            hintText: 'Password',
            isPassword: true,
  
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(color: kGrey, fontSize: 14),
                ),
              ),
            ),
          ),
          const Button(buttonName: 'Sign in', height: 42, width: 130,page: SignUpPage(),)
        ],
      ),
    );
  }
}
