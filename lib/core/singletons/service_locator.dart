import 'package:edu_platform/core/singletons/dio_settings.dart';
import 'package:edu_platform/features/Courses/data/datasource/Courses_data_source.dart';
import 'package:edu_platform/features/courses/data/repo/courses_repo_impl.dart';
import 'package:edu_platform/features/messages/data/datasource/chat_data_source.dart';
import 'package:edu_platform/features/messages/data/repo/chat_repo_impl.dart';
import 'package:edu_platform/features/tutors/data/datasource/tutors_data_source.dart';
import 'package:edu_platform/features/tutors/data/repo/tutors_repo_impl.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
        () => TutorsRepoImpl(dataSource: TutorsDataSourceImpl()))
    ..registerLazySingleton(
        () => CoursesRepoImpl(dataSource: CoursesDataSourceImpl()))
    ..registerLazySingleton(
        () => ChatRepoImpl(dataSource: ChatDataSourceImpl()));
}
