import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/main/data/model/event_filter_model.dart';
import 'package:edu_platform/features/main/domain/entity/event_user_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, GenericPagination<EventUserEntity>>> eventsUser(EventFilter param);
}
