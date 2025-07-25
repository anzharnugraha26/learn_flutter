import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_flow_bloc/bloc/login_event.dart';
import 'package:short_flow_bloc/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(email: '', password: '')) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      await Future.delayed(const Duration(seconds: 2));

      if (state.email == 'admin@gmail.com' && state.password == '123456') {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: 'Email dan password salah',
        ));
      }
    });
  }
}
