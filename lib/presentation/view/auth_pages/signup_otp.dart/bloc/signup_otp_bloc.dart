import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';

part 'signup_otp_event.dart';
part 'signup_otp_state.dart';

class SignupOtpBloc extends Bloc<SignupOtpEvent, SignupOtpState> {
  SignupOtpBloc() : super(SignupOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) {
      AuthService.otpVerification(token: event.token, otp: event.otp);
    });
  }
}
