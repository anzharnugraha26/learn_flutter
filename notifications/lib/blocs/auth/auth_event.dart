abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  final String fcmToken;

  AuthLoginRequested({
    required this.email,
    required this.password,
    required this.fcmToken,
  });
}
