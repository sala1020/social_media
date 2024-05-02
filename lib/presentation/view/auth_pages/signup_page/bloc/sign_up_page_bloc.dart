// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/auth_model/signup_user_model.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/signup_otp.dart';

part 'sign_up_page_event.dart';
part 'sign_up_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc() : super(SignUpPageInitial()) {
    on<UserDataEvent>((event, emit) async {
 
        final String token =
            await AuthService.createUser(userData: event.userData);
        if (token.isNotEmpty) {
          kPushNavigation(
            context: event.context,
            page: SignUpOtpPage(
              token: token,
            ),
          );
        }
    
    });

    on<PasswordVisibilityEvent>((event, emit) {
      emit(PasswordVisibilityState(obscureTextEmit: !event.obscureText));
    });
  }
}
