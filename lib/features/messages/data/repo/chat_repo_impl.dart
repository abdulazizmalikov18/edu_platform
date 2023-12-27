// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:edu_platform/core/exceptions/exceptions.dart';
import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/messages/data/datasource/chat_data_source.dart';
import 'package:edu_platform/features/messages/domain/entity/create_mesage.dart';
import 'package:edu_platform/features/messages/domain/entity/filter_messages.dart';
import 'package:edu_platform/features/messages/domain/entity/messages_entity.dart';
import 'package:edu_platform/features/messages/domain/repo/chat_repo.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';

class ChatRepoImpl extends ChatRepo {
  final ChatDataSourceImpl dataSource;

  ChatRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<TutorsEntity>>> chatsList() async {
    try {
      final result = await dataSource.chatList();
      return Right(result);
    } on DioExceptions {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, GenericPagination<MessagesEntity>>> getMessages(
      MessageFilter param) async {
    try {
      final result = await dataSource.getMessages(param);
      return Right(result);
    } on DioExceptions {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> putMessage(CreateMessage param) async {
    try {
      final result = await dataSource.putMessage(param);
      return Right(result);
    } on DioExceptions {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioError {
      return Left(DioFailure());
    }
  }
}
