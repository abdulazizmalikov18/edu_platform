import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/messages/data/repo/chat_repo_impl.dart';
import 'package:edu_platform/features/messages/domain/repo/chat_repo.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';

class ChatUseUseCase
    extends UseCase<GenericPagination<TutorsEntity>, NoParams> {
  final ChatRepo repository = serviceLocator<ChatRepoImpl>();

  @override
  Future<Either<Failure, GenericPagination<TutorsEntity>>> call(
          NoParams params) async =>
      await repository.chatsList();
}
