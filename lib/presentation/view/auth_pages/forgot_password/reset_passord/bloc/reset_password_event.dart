part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class ResetingPasswordEvent extends ResetPasswordEvent {
  final String otp;
  final String token;
  final BuildContext context;
  final String newPassword;
  final String confirmPassword;

  ResetingPasswordEvent({
    required this.otp,
    required this.token,
    required this.context,
    required this.newPassword,
    required this.confirmPassword,
  });
}
