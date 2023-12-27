import 'package:edu_platform/features/messages/data/models/from_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class FromUserEntity extends Equatable {
  final int id;

  const FromUserEntity({this.id = 0});

  @override
  List<Object?> get props => [id];
}

class FromUserConverter implements JsonConverter<FromUserEntity, Map<String, dynamic>?> {
  const FromUserConverter();
  @override
  FromUserEntity fromJson(Map<String, dynamic>? json) => FromUserModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(FromUserEntity object) => {};
}
