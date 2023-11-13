// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:edu_platform/core/exceptions/exceptions.dart';
import 'package:edu_platform/core/singletons/dio_settings.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/common/repo/storage_repository.dart';
import 'package:edu_platform/features/tutors/data/models/tutors_model.dart';

abstract class TutorsDataSource {
  Future<GenericPagination<TutorsModel>> tutorsList();
  Future<GenericPagination<TutorsModel>> tutorsFavoriteList();
}

class TutorsDataSourceImpl extends TutorsDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<GenericPagination<TutorsModel>> tutorsList() async {
    try {
      final response = await dio.get(
        'user/success/tutor',
        queryParameters: {'page': 1, 'limit': 10},
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Bearer ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => TutorsModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<TutorsModel>> tutorsFavoriteList() async {
    try {
      final response = await dio.get(
        'favourite-teacher',
        queryParameters: {'page': 1, 'limit': 10},
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Bearer ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => TutorsModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
