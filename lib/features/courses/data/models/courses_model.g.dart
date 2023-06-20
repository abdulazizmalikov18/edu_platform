// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesModel _$CoursesModelFromJson(Map<String, dynamic> json) => CoursesModel(
      id: json['id'] as int? ?? 0,
      note: json['note'] ?? '',
      isActive: json['isActive'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      lastEditedAt: json['lastEditedAt'] as String? ?? '',
      deletedAt: json['deletedAt'] ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      descr: json['descr'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      result: json['result'] as String? ?? '',
      presentation: json['presentation'] as String? ?? '',
      level: json['level'] as String? ?? '',
      term: json['term'] as int? ?? 0,
    );

Map<String, dynamic> _$CoursesModelToJson(CoursesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'lastEditedAt': instance.lastEditedAt,
      'deletedAt': instance.deletedAt,
      'name': instance.name,
      'image': instance.image,
      'descr': instance.descr,
      'overview': instance.overview,
      'result': instance.result,
      'presentation': instance.presentation,
      'level': instance.level,
      'term': instance.term,
    };
