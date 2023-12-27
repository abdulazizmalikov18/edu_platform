// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    MessagesModel(
      id: json['id'] as int? ?? 0,
      note: json['note'] ?? "",
      isActive: json['isActive'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
      lastEditedAt: json['lastEditedAt'] as String? ?? "",
      deletedAt: json['deletedAt'] ?? "",
      message: json['message'] as String? ?? "",
      fromUser: json['fromUser'] == null
          ? const FromUserEntity()
          : const FromUserConverter()
              .fromJson(json['fromUser'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MessagesModelToJson(MessagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'lastEditedAt': instance.lastEditedAt,
      'deletedAt': instance.deletedAt,
      'message': instance.message,
      'fromUser': const FromUserConverter().toJson(instance.fromUser),
    };
