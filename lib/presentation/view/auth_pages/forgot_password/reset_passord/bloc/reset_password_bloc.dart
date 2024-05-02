// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/auth_pages/signin_page/signin_page.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetingPasswordEvent>((event, emit) async {
      final isSuccess = await AuthService.resetPassword(
        confirmPassword: event.confirmPassword,
        newPassword: event.confirmPassword,
        otp: event.otp,
        token: event.token,
        context: event.context
      );
      if (isSuccess == true) {
        kPushReplacemntNavigation(context: event.context, page: const SignIn());
      }
    });
  }
}
