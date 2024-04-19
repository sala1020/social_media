part of 'sign_up_page_bloc.dart';

@immutable
sealed class SignUpPageEvent {}

final class UserDataEvent extends SignUpPageEvent {
  final UserModel userData;
  final BuildContext context;

  UserDataEvent({required this.userData,required this.context});
}

final class PasswordVisibilityEvent extends SignUpPageEvent{
 final bool obscureText;

  PasswordVisibilityEvent({required this.obscureText});
  
}
