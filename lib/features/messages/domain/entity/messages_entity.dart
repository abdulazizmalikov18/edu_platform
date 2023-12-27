import 'package:edu_platform/features/messages/domain/entity/from_user_entity.dart';
import 'package:equatable/equatable.dart';

class MessagesEntity extends Equatable {
  final int id;
  final dynamic note;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String lastEditedAt;
  final dynamic deletedAt;
  final String message;
  @FromUserConverter()
  final FromUserEntity fromUser;

  const MessagesEntity({
    this.id = 0,
    this.note = "",
    this.isActive = false,
    this.isDeleted = false,
    this.createdAt = "",
    this.lastEditedAt = "",
    this.deletedAt = "",
    this.message = "",
    this.fromUser = const FromUserEntity(),
  });

  @override
  List<Object?> get props => [
        id,
        note,
        isActive,
        isDeleted,
        createdAt,
        lastEditedAt,
        deletedAt,
        message,
        fromUser,
      ];
}
