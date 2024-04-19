import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/forgot_passeord.dart';
import 'package:social_media/presentation/view/auth_pages/reg_exp/regexp.dart';
import 'package:social_media/presentation/view/auth_pages/signin_page/bloc/s_ign_in_page_bloc.dart';

class SectionSignIn2 extends StatelessWidget {
  SectionSignIn2({
    super.key,
  });
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color.fromARGB(43, 255, 193, 7),
      height: 260,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: formKey,
              child: Column(
                children: [
                  InputFieldAuth(
                    hintText: 'Email Address',
                    controller: Controllers.emailController,
                    inputType: TextInputType.emailAddress,
                    regx: RegExpp.emailValidator,
                    emptyMessage: 'This field is empty',
                    validateMessage: 'plz enter a valid email',
                  ),
                  kHeight10,
                  InputFieldAuth(
                    hintText: 'Password',
                    isPassword: true,
                    controller: Controllers.passwordController,
                    regx: RegExpp.passwordValidator,
                    emptyMessage: 'This field is empty',
                    validateMessage: 'Pasword must contain 8 letters and a special character',
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ));
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(color: kGrey, fontSize: 14),
                ),
              ),
            ),
          ),
          Button(
            buttonName: 'Sign in',
            height: 42,
            width: 130,
            ontap: () {
              if (formKey.currentState!.validate()) {
                context.read<SIgnInPageBloc>().add(
                      SignInDataEvent(
                          email: Controllers.emailController.text,
                          password: Controllers.passwordController.text,
                          context: context),
                    );
              }
              ;
            },
          )
        ],
      ),
    );
  }
}
