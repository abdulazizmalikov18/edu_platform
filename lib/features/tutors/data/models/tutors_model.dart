import 'package:edu_platform/features/tutors/domain/entity/event_entity.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:edu_platform/features/tutors/domain/entity/rating_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tutors_model.g.dart';

@JsonSerializable()
class TutorsModel extends TutorsEntity {
  const TutorsModel({
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
    super.password,
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
    super.code,
    super.balance,
    super.isOnline,
    super.event,
    super.rating,
    super.isFavourite,
  });

  factory TutorsModel.fromJson(Map<String, dynamic> json) =>
      _$TutorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorsModelToJson(this);
}
