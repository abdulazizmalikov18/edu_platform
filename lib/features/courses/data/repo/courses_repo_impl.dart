// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:edu_platform/core/exceptions/exceptions.dart';
import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/Courses/data/datasource/Courses_data_source.dart';
import 'package:edu_platform/features/courses/domain/entity/courses_entity.dart';
import 'package:edu_platform/features/courses/domain/repo/courses_repo.dart';

class CoursesRepoImpl extends CoursesRepo {
  final CoursesDataSourceImpl dataSource;

  CoursesRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<CoursesEntity>>>
      coursesList() async {
    try {
      final result = await dataSource.coursesList();
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
