import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/courses/data/repo/courses_repo_impl.dart';
import 'package:edu_platform/features/courses/domain/entity/courses_entity.dart';
import 'package:edu_platform/features/courses/domain/repo/courses_repo.dart';

class CoursesUseUseCase
    extends UseCase<GenericPagination<CoursesEntity>, NoParams> {
  final CoursesRepo repository = serviceLocator<CoursesRepoImpl>();

  @override
  Future<Either<Failure, GenericPagination<CoursesEntity>>> call(
          NoParams params) async =>
      await repository.coursesList();
}
