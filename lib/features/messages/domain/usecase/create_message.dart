import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/singletons/service_locator.dart';
import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/messages/data/repo/chat_repo_impl.dart';
import 'package:edu_platform/features/messages/domain/entity/create_mesage.dart';
import 'package:edu_platform/features/messages/domain/repo/chat_repo.dart';

class CreateMessageUseCase extends UseCase<bool, CreateMessage> {
  final ChatRepo repository = serviceLocator<ChatRepoImpl>();

  @override
  Future<Either<Failure, bool>> call(CreateMessage params) async =>
      await repository.putMessage(params);
}
