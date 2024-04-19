part of 'sign_up_page_bloc.dart';

@immutable
sealed class SignUpPageState {}

final class SignUpPageInitial extends SignUpPageState {}

final class UserDataState extends SignUpPageState {}

class PasswordVisibilityState extends SignUpPageState {
  final bool obscureTextEmit;

  PasswordVisibilityState({required this.obscureTextEmit});
}
