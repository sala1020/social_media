import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/signup_user_model.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/reg_exp/regexp.dart';
import 'package:social_media/presentation/view/auth_pages/signup_page/bloc/sign_up_page_bloc.dart';

class InputFields extends StatelessWidget {
  InputFields({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      width: double.infinity,
      child: Column(
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                InputFieldAuth(
                  hintText: 'Name',
                  controller: Controllers.nameController,
                ),
                kHeight5,
                InputFieldAuth(
                  hintText: 'Username',
                  controller: Controllers.usernameController,
                  regx: RegExpp.nameValidator,
                  validateMessage: 'should contain 4 character',
                ),
                kHeight10,
                InputFieldAuth(
                  hintText: 'Email Address',
                  controller: Controllers.emailController,
                  regx: RegExpp.emailValidator,
                  validateMessage: 'enter a valid mail',
                ),
                kHeight5,
                InputFieldAuth(
                  hintText: 'Password',
                  controller: Controllers.passwordController,
                  isPassword: true,
                  regx: RegExpp.passwordValidator,
                  validateMessage:
                      'Pasword must contain 8 letters and a special character',
                ),
                kHeight10,
                InputFieldAuth(
                  hintText: 'ConfirmPassword',
                  controller: Controllers.confirmPasswordController,
                  isPassword: true,
                  regx: RegExpp.passwordValidator,
                  validateMessage:
                      'Pasword must contain 8 letters and a special character',
                ),
                kHeight10,
              ],
            ),
          ),
          Button(
            buttonName: 'SignUp',
            height: 42,
            width: 130,
            ontap: () {
              print('clickedbutton');
              if (formkey.currentState!.validate()) {
                context.read<SignUpPageBloc>().add(
                      UserDataEvent(
                        context: context,
                        userData: UserModel(
                          name: Controllers.nameController.text,
                          username: Controllers.usernameController.text,
                          email: Controllers.emailController.text,
                          password: Controllers.passwordController.text,
                          confirmPassword:
                              Controllers.confirmPasswordController.text,
                        ),
                      ),
                    );
                      formkey.currentState!.reset();
                    
              }
            },
          )
        ],
      ),
    );
  }
}
