import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/messages/data/repo/chat_repo_impl.dart';
import 'package:edu_platform/features/messages/domain/entity/filter_messages.dart';
import 'package:edu_platform/features/messages/domain/entity/messages_entity.dart';
import 'package:edu_platform/features/messages/domain/repo/chat_repo.dart';

class MessagesUseCase extends UseCase<GenericPagination<MessagesEntity>, MessageFilter> {
  final ChatRepo repository = serviceLocator<ChatRepoImpl>();

  @override
  Future<Either<Failure, GenericPagination<MessagesEntity>>> call(MessageFilter params) async =>
      await repository.getMessages(params);
}
