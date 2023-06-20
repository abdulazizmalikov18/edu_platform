part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;
  AuthenticationStatusChanged({required this.status});
}

class LoginUser extends AuthenticationEvent {
  final String email;
  final String password;

  final Function(String)? onError;
  final VoidCallback? onSuccess;
  LoginUser({
    required this.email,
    required this.password,
    this.onError,
    this.onSuccess,
  });
}

class CheckUser extends AuthenticationEvent {}

class UpdateCard extends AuthenticationEvent {
  final String cardNumber;

  UpdateCard(this.cardNumber);
}

class CheckLogin extends AuthenticationEvent {}

class Logout extends AuthenticationEvent {}

class RefreshToken extends AuthenticationEvent {}

class ChangeNotificationAllRead extends AuthenticationEvent {}
