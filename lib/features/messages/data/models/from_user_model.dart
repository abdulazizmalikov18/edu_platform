import 'package:edu_platform/features/messages/domain/entity/from_user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'from_user_model.g.dart';

@JsonSerializable()
class FromUserModel extends FromUserEntity {
  const FromUserModel({super.id});

  factory FromUserModel.fromJson(Map<String, dynamic> json) => _$FromUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$FromUserModelToJson(this);
}
