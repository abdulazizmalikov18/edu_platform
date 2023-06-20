import 'package:edu_platform/features/common/domain/entity/data_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class DataModel extends DataEntity {
  const DataModel({
    super.id,
    super.note,
    super.isActive,
    super.isDeleted,
    super.createdAt,
    super.lastEditedAt,
    super.deletedAt,
    super.displayname,
    super.rejectDescr,
    super.accent,
    super.address,
    super.currentAddress,
    super.firstname,
    super.lastname,
    super.email,
    super.birthday,
    super.googleId,
    super.facebookId,
    super.appleId,
    super.phone,
    super.introVideo,
    super.gender,
    super.role,
    super.whom,
    super.verify,
    super.about,
    super.aboutTeacher,
    super.lang,
    super.photo,
    super.balance,
    super.isOnline,
    super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
