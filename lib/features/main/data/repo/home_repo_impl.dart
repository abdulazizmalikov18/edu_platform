// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:edu_platform/core/exceptions/exceptions.dart';
import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/main/data/data_source/home_data_source.dart';
import 'package:edu_platform/features/main/data/model/event_filter_model.dart';
import 'package:edu_platform/features/main/domain/entity/event_user_entity.dart';
import 'package:edu_platform/features/main/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final EventsDataSource dataSource;

  HomeRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<EventUserEntity>>> eventsUser(EventFilter param) async {
    try {
      final result = await dataSource.eventsUser(param);
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
