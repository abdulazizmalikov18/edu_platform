import 'package:dio/dio.dart';
import 'package:edu_platform/core/singletons/dio_settings.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/common/repo/error_handle.dart';
import 'package:edu_platform/features/common/repo/storage_repository.dart';
import 'package:edu_platform/features/main/data/model/event_filter_model.dart';
import 'package:edu_platform/features/main/data/model/event_user_model.dart';

abstract class EventsDataSource {
  Future<GenericPagination<EventUserModel>> eventsUser(EventFilter param);
}

class EventsDataSourceImpl implements EventsDataSource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<GenericPagination<EventUserModel>> eventsUser(EventFilter param) {
    return _handle.apiCantrol(
      request: () {
        return dio.get(
          'event/user',
          queryParameters: param.toJson(),
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {'Authorization': 'Bearer ${StorageRepository.getString('token')}'}
                : {},
          ),
        );
      },
      body: (response) => GenericPagination.fromJson(
        response,
        (value) => EventUserModel.fromJson(value as Map<String, dynamic>),
      ),
    );
  }
}
