import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_streaming_ui/pages/signup-page/controller/repository.dart';

import '../model/model.dart';

part 'signup_events.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository repository;

  SignupBloc({required this.repository}) : super(SignupInitial()) {
    on<SignupUser>(_signupUser);
  }

  void _signupUser(SignupUser event, emit) async {
    try {
      emit(SignupLoading());
      final user = await repository.signup(event.variables);
      emit(SignupSuccess(user: user));
    } catch (e) {
      emit(SignupFailure(error: e.toString()));
    }
  }
}
