import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/utils/session_manager.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../repositories/auth_repository.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepo.login(
          email: event.email,
          password: event.password,
          fcmToken: event.fcmToken,
        );

        await SessionManager.saveSession(
          token: result['token'],
          user: result['user'],
        );

        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
