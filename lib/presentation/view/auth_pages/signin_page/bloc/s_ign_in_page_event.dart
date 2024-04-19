part of 's_ign_in_page_bloc.dart';

@immutable
sealed class SIgnInPageEvent {}

final class SignInDataEvent extends SIgnInPageEvent{
  final String email;
  final String password;
  final BuildContext context;

  SignInDataEvent({required this.email, required this.password,required this.context});

}
