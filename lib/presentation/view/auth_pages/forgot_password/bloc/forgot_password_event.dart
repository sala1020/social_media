part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ValidateEmailEvent extends ForgotPasswordEvent {
  final String email;
  final BuildContext context;

  ValidateEmailEvent({required this.email,required this.context, });
}
