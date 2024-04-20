import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/reset_passord/reset_password.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ValidateEmailEvent>((event, emit) async {
      final token = await AuthService.verifyEmail(email: event.email);
      if (token.isNotEmpty) {
        kPushNavigation(
            // ignore: use_build_context_synchronously
            context: event.context,
            page: ResetPassword(token: token));
      }
      event.formKey.currentState!.reset();
    });
  }
}
