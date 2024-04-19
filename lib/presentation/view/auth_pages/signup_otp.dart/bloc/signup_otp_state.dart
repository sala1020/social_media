part of 'signup_otp_bloc.dart';

@immutable
sealed class SignupOtpState {}

final class SignupOtpInitial extends SignupOtpState {}


final class VerifyOtpState extends SignupOtpBloc{}