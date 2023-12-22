import 'package:edu_platform/features/main/domain/entity/event_user_entity.dart';
import 'package:edu_platform/features/main/domain/entity/zoom_event_entity.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_user_model.g.dart';

@JsonSerializable()
class EventUserModel extends EventUserEntity {
  const EventUserModel({
    super.id,
    super.note,
    super.isActive,
    super.isDeleted,
    super.createdAt,
    super.lastEditedAt,
    super.deletedAt,
    super.dateFrom,
    super.zoom,
    super.dateTo,
    super.dateStarted,
    super.dateCompleted,
    super.statusName,
    super.statusCode,
    super.teacher,
    super.user,
    super.course,
  });

  factory EventUserModel.fromJson(Map<String, dynamic> json) => _$EventUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventUserModelToJson(this);
}
