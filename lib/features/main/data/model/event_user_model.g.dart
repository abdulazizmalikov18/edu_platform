// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventUserModel _$EventUserModelFromJson(Map<String, dynamic> json) =>
    EventUserModel(
      id: json['id'] as int? ?? 0,
      note: json['note'] ?? "",
      isActive: json['isActive'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
      lastEditedAt: json['lastEditedAt'] as String? ?? "",
      deletedAt: json['deletedAt'] ?? "",
      dateFrom: json['dateFrom'] as String? ?? "",
      zoom: json['zoom'] == null
          ? const ZoomEntity()
          : const ZoomConverter()
              .fromJson(json['zoom'] as Map<String, dynamic>?),
      dateTo: json['dateTo'] as String? ?? "",
      dateStarted: json['dateStarted'] ?? "",
      dateCompleted: json['dateCompleted'] ?? "",
      statusName: json['statusName'] as String? ?? "",
      statusCode: json['statusCode'] as String? ?? "",
      teacher: json['teacher'] == null
          ? const TutorsEntity()
          : const TutorsEntityConverter()
              .fromJson(json['teacher'] as Map<String, dynamic>?),
      user: json['user'] == null
          ? const TutorsEntity()
          : const TutorsEntityConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      course: json['course'] ?? "",
    );

Map<String, dynamic> _$EventUserModelToJson(EventUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'lastEditedAt': instance.lastEditedAt,
      'deletedAt': instance.deletedAt,
      'dateFrom': instance.dateFrom,
      'zoom': const ZoomConverter().toJson(instance.zoom),
      'dateTo': instance.dateTo,
      'dateStarted': instance.dateStarted,
      'dateCompleted': instance.dateCompleted,
      'statusName': instance.statusName,
      'statusCode': instance.statusCode,
      'teacher': const TutorsEntityConverter().toJson(instance.teacher),
      'user': const TutorsEntityConverter().toJson(instance.user),
      'course': instance.course,
    };
