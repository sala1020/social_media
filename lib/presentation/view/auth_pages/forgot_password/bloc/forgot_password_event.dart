part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ValidateEmailEvent extends ForgotPasswordEvent {
  final String email;
  final BuildContext context;
  final GlobalKey<FormState> formKey;

  ValidateEmailEvent({required this.email,required this.context,required this.formKey,  });
}
