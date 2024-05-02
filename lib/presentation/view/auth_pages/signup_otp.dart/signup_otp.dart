import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/bloc/signup_otp_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/widgets/otp_fields.dart';

class SignUpOtpPage extends StatelessWidget {
  final String token;
  SignUpOtpPage({super.key, required this.token});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: kBg),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MainTitle(heading: 'OTP Verification'),
            kHeight90,
            Text('We have sent you a verification code to\nyour email address',
                style: kInfoFont),
            kHeight15,
            Form(key: formkey, child:  const OtpFields()),
            kHeight30,
            Button(
              buttonName: 'Submit',
              height: 42,
              width: 150,
              ontap: () {
                if (formkey.currentState!.validate()) {
                  context.read<SignupOtpBloc>().add(VerifyOtpEvent(
                      otp:
                          '${Controllers.firstFieldController.text}${Controllers.secondFieldController.text}${Controllers.thirdFieldController.text}${Controllers.fourthFieldController.text}',
                      token: token,
                      context: context));

                  formkey.currentState!.reset();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
