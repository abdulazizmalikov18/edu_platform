part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserModel user;
  const AuthenticationState._({required this.status, required this.user});
  const AuthenticationState.authenticated(UserModel user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );
  const AuthenticationState.update(UserModel user)
      : this._(
          status: AuthenticationStatus.cancelLoading,
          user: user,
        );
  const AuthenticationState.unauthenticated()
      : this._(
            status: AuthenticationStatus.unauthenticated,
            user: const UserModel());
  const AuthenticationState.loading()
      : this._(status: AuthenticationStatus.loading, user: const UserModel());
  const AuthenticationState.cancelLoading()
      : this._(
            status: AuthenticationStatus.cancelLoading,
            user: const UserModel());

  @override
  List<Object?> get props => [user, status];

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    UserModel? user,
  }) =>
      AuthenticationState._(
          status: status ?? this.status, user: user ?? this.user);
}
