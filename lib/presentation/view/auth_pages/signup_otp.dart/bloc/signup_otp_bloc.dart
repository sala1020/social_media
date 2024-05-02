// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/ineracting_pages/bottomnav/bottom_nav.dart';

part 'signup_otp_event.dart';
part 'signup_otp_state.dart';

class SignupOtpBloc extends Bloc<SignupOtpEvent, SignupOtpState> {
  SignupOtpBloc() : super(SignupOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      final isSuccess =
          await AuthService.otpVerification(token: event.token, otp: event.otp,context: event.context);
      if (isSuccess == true) {
        kPushNavigation(context: event.context, page: BottomNav());
      }
    });
  }
}
