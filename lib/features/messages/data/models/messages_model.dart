import 'package:edu_platform/features/messages/domain/entity/from_user_entity.dart';
import 'package:edu_platform/features/messages/domain/entity/messages_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_model.g.dart';

@JsonSerializable()
class MessagesModel extends MessagesEntity {
  const MessagesModel({
    super.id,
    super.note,
    super.isActive,
    super.isDeleted,
    super.createdAt,
    super.lastEditedAt,
    super.deletedAt,
    super.message,
    super.fromUser,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => _$MessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesModelToJson(this);
}
