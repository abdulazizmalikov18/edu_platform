import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:edu_platform/core/utils/either.dart';
import 'package:edu_platform/features/common/pagination/models/generic_pagination.dart';
import 'package:edu_platform/features/messages/domain/entity/create_mesage.dart';
import 'package:edu_platform/features/messages/domain/entity/filter_messages.dart';
import 'package:edu_platform/features/messages/domain/entity/messages_entity.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';

abstract class ChatRepo {
  Future<Either<Failure, GenericPagination<TutorsEntity>>> chatsList();
  Future<Either<Failure, GenericPagination<MessagesEntity>>> getMessages(MessageFilter param);
  Future<Either<Failure, bool>> putMessage(CreateMessage param);
}
