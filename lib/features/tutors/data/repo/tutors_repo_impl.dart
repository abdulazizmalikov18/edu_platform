// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:edu_platform/core/exceptions/exceptions.dart';
import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/tutors/data/datasource/tutors_data_source.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:edu_platform/features/tutors/domain/repo/tutors_repo.dart';

class TutorsRepoImpl extends TutorsRepo {
  final TutorsDataSourceImpl dataSource;

  TutorsRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<TutorsEntity>>> tutorsList() async {
    try {
      final result = await dataSource.tutorsList();
      return Right(result);
    } on DioExceptions {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, GenericPagination<TutorsEntity>>>
      tutorsFavoriteList() async {
    try {
      final result = await dataSource.tutorsFavoriteList();
      return Right(result);
    } on DioExceptions {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioError {
      return Left(DioFailure());
    }
  }
}
