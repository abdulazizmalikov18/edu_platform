// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      status: json['status'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? const DataEntity()
          : const DataEntityConverter()
              .fromJson(json['data'] as Map<String, dynamic>?),
    );
