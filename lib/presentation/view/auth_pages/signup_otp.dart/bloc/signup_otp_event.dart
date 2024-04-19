part of 'signup_otp_bloc.dart';

@immutable
sealed class SignupOtpEvent {}

final class VerifyOtpEvent extends SignupOtpEvent {
  final String otp;
  final String token;
  final BuildContext context;

  VerifyOtpEvent({
    required this.otp,
    required this.token,
    required this.context,
  });
}
