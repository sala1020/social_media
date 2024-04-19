import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/reset_passord/bloc/reset_password_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/reg_exp/regexp.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/widgets/otp_fields.dart';

class ResetPassword extends StatelessWidget {
  final String token;
  ResetPassword({Key? key, required this.token}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: bg),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MainTitle(heading: 'Reset your password'),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'Enter OTP here',
                        style: kSplashButton,
                      ),
                      kHeight15,
                      const OtpFields(),
                      kHeight30,
                      Text(
                        'Enter password here',
                        style: kSplashButton,
                      ),
                      kHeight15,
                      InputFieldAuth(
                        hintText: 'New Password',
                        controller: Controllers.newpasswordController,
                        regx: RegExpp.passwordValidator,
                        validateMessage:
                            'Password must contain 8 letters and a special character',
                      ),
                      kHeight15,
                      InputFieldAuth(
                        hintText: 'Confirm Password',
                        controller: Controllers.confirmPasswordController,
                        regx: RegExpp.passwordValidator,
                        validateMessage:
                            'Password must contain 8 letters and a special character',
                      ),
                    ],
                  ),
                ),
                kHeight15,
                Button(
                  buttonName: 'Reset',
                  height: 40,
                  width: 100,
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<ResetPasswordBloc>().add(
                            ResetingPasswordEvent(
                              otp:
                                  '${Controllers.firstFieldController.text}${Controllers.secondFieldController.text}${Controllers.thirdFieldController.text}${Controllers.fourthFieldController.text}',
                              token: token,
                              context: context,
                              newPassword:
                                  Controllers.newpasswordController.text,
                              confirmPassword:
                                  Controllers.confirmPasswordController.text,
                            ),
                          );
                      print(
                          '${Controllers.confirmPasswordController.text}${Controllers.newpasswordController.text}');
                      print(
                          '${Controllers.firstFieldController.text}${Controllers.secondFieldController.text}${Controllers.thirdFieldController.text}${Controllers.fourthFieldController.text}');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
