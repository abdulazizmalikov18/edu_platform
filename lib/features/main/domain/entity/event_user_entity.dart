import 'package:edu_platform/features/main/domain/entity/zoom_event_entity.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:equatable/equatable.dart';

class EventUserEntity extends Equatable {
  final int id;
  final dynamic note;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String lastEditedAt;
  final dynamic deletedAt;
  final String dateFrom;
  @ZoomConverter()
  final ZoomEntity zoom;
  final String dateTo;
  final dynamic dateStarted;
  final dynamic dateCompleted;
  final String statusName;
  final String statusCode;
  @TutorsEntityConverter()
  final TutorsEntity teacher;
  @TutorsEntityConverter()
  final TutorsEntity user;
  final dynamic course;

  const EventUserEntity({
    this.id = 0,
    this.note = "",
    this.isActive = false,
    this.isDeleted = false,
    this.createdAt = "",
    this.lastEditedAt = "",
    this.deletedAt = "",
    this.dateFrom = "",
    this.zoom = const ZoomEntity(),
    this.dateTo = "",
    this.dateStarted = "",
    this.dateCompleted = "",
    this.statusName = "",
    this.statusCode = "",
    this.teacher = const TutorsEntity(),
    this.user = const TutorsEntity(),
    this.course = "",
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
        dateFrom,
        zoom,
        dateTo,
        dateStarted,
        dateCompleted,
        statusName,
        statusCode,
        teacher,
        user,
        course,
      ];
}
