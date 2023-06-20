import 'package:edu_platform/features/tutors/domain/entity/event_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends EventEntity {
  const EventModel({
    super.studentCount,
    super.count
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
