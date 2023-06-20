import 'package:edu_platform/features/tutors/data/models/event_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class EventEntity extends Equatable {
  final int studentCount;
  final int count;

  const EventEntity({
    this.studentCount = 0,
    this.count = 0,
  });

  @override
  List<Object?> get props => [studentCount, count];
}

class EventEntityConverter
    implements JsonConverter<EventEntity, Map<String, dynamic>?> {
  const EventEntityConverter();
  @override
  EventEntity fromJson(Map<String, dynamic>? json) =>
      EventModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(EventEntity object) => {};
}
