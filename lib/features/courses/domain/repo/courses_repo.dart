import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/courses/domain/entity/courses_entity.dart';

abstract class CoursesRepo {
  Future<Either<Failure, GenericPagination<CoursesEntity>>> coursesList();
}