// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:edu_platform/core/exceptions/exceptions.dart';
import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/auth/presentation/controllers/auth/authentication_bloc.dart';
import 'package:edu_platform/features/common/data/models/user.dart';
import 'package:edu_platform/features/common/repo/global_request_repository.dart';
import 'package:edu_platform/features/common/repo/storage_repository.dart';

class AuthRepository {
  final GlobalRequestRepository repo = GlobalRequestRepository();
  final StreamController<AuthenticationStatus> authStream =
      StreamController.broadcast(sync: true);

  Future<Either<Failure, UserModel>> getUser() async {
    final result = await repo.getSingle(
      endpoint: 'user/me',
      fromJson: UserModel.fromJson,
    );
    return result;
  }

  Future<Either<Failure, UserModel>> putUser(
      {required int id, required String cardNumber}) async {
    final result = await repo.putSingle(
      endpoint: 'employee/$id',
      fromJson: UserModel.fromJson,
      data: {"card_number": cardNumber},
    );
    return result;
  }

  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final result = await repo.postAndSingle<UserModel>(
        endpoint: 'user/login',
        fromJson: UserModel.fromJson,
        sendToken: false,
        data: {"email": email, "password": password},
      );
      if (result.isRight) {
        await StorageRepository.putString(
          key: 'token',
          value: result.right.data.token,
        );
        return Right(result.right);
      } else {
        return Left(result.left);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: '$e catch error');
    }
  }

  Future<Either<Failure, UserModel>> signUpEmail({
    required String email,
    required String password,
    required String whom,
    required String name,
  }) async {
    try {
      final result = await repo.postAndSingle<UserModel>(
        endpoint: 'user/client/register',
        fromJson: UserModel.fromJson,
        sendToken: false,
        data: {
          "email": email,
          "password": password,
          "whom": whom,
          "firstname": name
        },
      );
      if (result.isRight) {
        await StorageRepository.putString(
          key: 'token',
          value: result.right.data.token,
        );
        return Right(result.right);
      } else {
        return Left(result.left);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: '$e catch error');
    }
  }
}
