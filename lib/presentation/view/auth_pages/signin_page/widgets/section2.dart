import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/forgot_passeord.dart';


class SectionSignIn2 extends StatelessWidget {
  const SectionSignIn2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color.fromARGB(43, 255, 193, 7),
      height: 260,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputFieldAuth(
            hintText: 'Email Address',
            controller: Controllers.emailController,
          ),
          kHeight10,
          InputFieldAuth(
            hintText: 'Password',
            isPassword: true,
            controller: Controllers.passwordController,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ));
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(color: kGrey, fontSize: 14),
                ),
              ),
            ),
          ),
          const Button(
            buttonName: 'Sign in',
            height: 42,
            width: 130,
   
          )
        ],
      ),
    );
  }
}
