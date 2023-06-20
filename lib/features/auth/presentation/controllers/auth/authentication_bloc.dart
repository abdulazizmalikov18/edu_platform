import 'dart:async';

import 'package:edu_platform/assets/constants/storage_keys.dart';
import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/features/common/data/models/user.dart';
import 'package:edu_platform/features/common/repo/auth.dart';
import 'package:edu_platform/features/common/repo/storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository repository;
  late StreamSubscription<AuthenticationStatus> statusSubscription;

  AuthenticationBloc(this.repository)
      : super(const AuthenticationState.unauthenticated()) {
    statusSubscription = repository.authStream.stream.listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });
    on<AuthenticationStatusChanged>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          final userData = await repository.getUser();
          if (userData.isRight) {
            emit(AuthenticationState.authenticated(userData.right));
          } else {
            emit(const AuthenticationState.unauthenticated());
          }
          break;
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.loading:
        case AuthenticationStatus.cancelLoading:
          break;
      }
    });
    on<UpdateCard>((event, emit) async {
      final userData = await repository.putUser(
        id: state.user.data.id,
        cardNumber: event.cardNumber,
      );
      final response = await repository.getUser();
      if (userData.isRight) {
        emit(AuthenticationState.update(response.right));
      }
    });
    on<Logout>((event, emit) async {
      await StorageRepository.putString(key: StorageKeys.TOKEN, value: '');
      add(AuthenticationStatusChanged(
          status: AuthenticationStatus.unauthenticated));
    });

    on<LoginUser>((event, emit) async {
      emit(const AuthenticationState.loading());
      final result =
          await repository.login(email: event.email, password: event.password);
      if (result.isRight) {
        if (event.onSuccess != null) {
          event.onSuccess!();
        }
        emit(const AuthenticationState.cancelLoading());
      } else {
        if (event.onError != null) {
          event.onError!((result.left as ServerFailure).errorMessage);
        }
        emit(const AuthenticationState.cancelLoading());
      }
    });

    on<CheckLogin>((event, emit) async {
      var isLogged = StorageRepository.getBool('isLogged');
      if (isLogged) {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated));
      } else {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated));
      }
    });

    on<CheckUser>((event, emit) async {
      final hasToken =
          StorageRepository.getString('token').isNotEmpty;
      if (hasToken) {
        final response = await repository.getUser();
        if (response.isRight) {
          add(AuthenticationStatusChanged(
              status: AuthenticationStatus.authenticated));
        } else {
          add(RefreshToken());
        }
      } else {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated));
      }
    });

    on<RefreshToken>((event, emit) async {
      add(AuthenticationStatusChanged(
          status: AuthenticationStatus.unauthenticated));
    });
  }

  @override
  Future<void> close() {
    statusSubscription.cancel();
    return super.close();
  }
}
