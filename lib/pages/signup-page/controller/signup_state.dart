part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserModel user;
  SignupSuccess({required this.user});
}

class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}
