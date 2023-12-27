// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:edu_platform/core/singletons/dio_settings.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/common/repo/error_handle.dart';
import 'package:edu_platform/features/common/repo/storage_repository.dart';
import 'package:edu_platform/features/messages/data/models/messages_model.dart';
import 'package:edu_platform/features/messages/domain/entity/create_mesage.dart';
import 'package:edu_platform/features/messages/domain/entity/filter_messages.dart';
import 'package:edu_platform/features/tutors/data/models/tutors_model.dart';

abstract class ChatDataSource {
  Future<GenericPagination<TutorsModel>> chatList();
  Future<GenericPagination<MessagesModel>> getMessages(MessageFilter param);
  Future<bool> putMessage(CreateMessage param);
}

class ChatDataSourceImpl extends ChatDataSource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<GenericPagination<TutorsModel>> chatList() async {
    return _handle.apiCantrol(
      request: () {
        return dio.get(
          'user/chat',
          queryParameters: {'page': 1, 'limit': 10},
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {'Authorization': 'Bearer ${StorageRepository.getString('token')}'}
                : {},
          ),
        );
      },
      body: (response) => GenericPagination.fromJson(
        response,
        (value) => TutorsModel.fromJson(value as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<GenericPagination<MessagesModel>> getMessages(MessageFilter param) async {
    return _handle.apiCantrol(
      request: () {
        return dio.get(
          'chat/${param.id}',
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
        (value) => MessagesModel.fromJson(value as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> putMessage(CreateMessage param) {
    return _handle.apiCantrol(
      request: () {
        return dio.post(
          'chat',
          data: {
            "message": param.message,
            "toUser": {"id": param.id}
          },
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {'Authorization': 'Bearer ${StorageRepository.getString('token')}'}
                : {},
          ),
        );
      },
      body: (response) => true,
    );
  }
}
