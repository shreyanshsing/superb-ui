part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupUser extends SignupEvent {
  final Map<String, dynamic> variables;

  SignupUser({required this.variables});
}
