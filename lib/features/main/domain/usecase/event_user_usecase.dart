import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/main/data/model/event_filter_model.dart';
import 'package:edu_platform/features/main/data/repo/home_repo_impl.dart';
import 'package:edu_platform/features/main/domain/entity/event_user_entity.dart';
import 'package:edu_platform/features/main/domain/repo/home_repo.dart';

class EventUserUseCase extends UseCase<GenericPagination<EventUserEntity>, EventFilter> {
  final HomeRepo repository = serviceLocator<HomeRepoImpl>();

  @override
  Future<Either<Failure, GenericPagination<EventUserEntity>>> call(EventFilter params) async =>
      await repository.eventsUser(params);
}
