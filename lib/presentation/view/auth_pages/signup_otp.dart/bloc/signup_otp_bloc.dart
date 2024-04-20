import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/home/bottomnav/bottom_nav.dart';

part 'signup_otp_event.dart';
part 'signup_otp_state.dart';

class SignupOtpBloc extends Bloc<SignupOtpEvent, SignupOtpState> {
  SignupOtpBloc() : super(SignupOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      print('object');
      final isSuccess =
          await AuthService.otpVerification(token: event.token, otp: event.otp);
      print(isSuccess);
      print(event.otp);
      if (isSuccess == true) {
        kPushNavigation(context: event.context, page: BottomNav());
      }
    });
  }
}
