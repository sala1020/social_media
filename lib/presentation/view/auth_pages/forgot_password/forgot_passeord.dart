import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/reg_exp/regexp.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final formKey = GlobalKey<FormState>();
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
            const MainTitle(heading: "Don't Worry,\n   We've Got Your back"),
            kHeight90,
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your email',
                    style: kInfoFont,
                  )),
            ),
            kHeight5,
            Form(
              key: formKey,
              child: InputFieldAuth(
                hintText: 'Email Address',
                controller: Controllers.emailController,
                regx: RegExpp.emailValidator,
                validateMessage: 'enter a valid mail',
              ),
            ),
            kHeight15,
            Button(
              buttonName: 'Submit',
              height: 40,
              width: 100,
              ontap: () {
                if (formKey.currentState!.validate()) {
                  context.read<ForgotPasswordBloc>().add(ValidateEmailEvent(
                      formKey: formKey,
                      context: context,
                      email: Controllers.emailController.text));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
