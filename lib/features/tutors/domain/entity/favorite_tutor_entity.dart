// import 'package:equatable/equatable.dart';

import 'package:edu_platform/features/tutors/data/models/tutors_model.dart';
import 'package:edu_platform/features/tutors/domain/entity/event_entity.dart';
import 'package:edu_platform/features/tutors/domain/entity/rating_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class TutorsEntity extends Equatable {
  final int id;
  final dynamic note;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String lastEditedAt;
  final dynamic deletedAt;
  final String displayname;
  final dynamic rejectDescr;
  final String accent;
  final String address;
  final String currentAddress;
  final String firstname;
  final String lastname;
  final String email;
  final String birthday;
  final dynamic googleId;
  final dynamic facebookId;
  final dynamic appleId;
  final String password;
  final String phone;
  final dynamic introVideo;
  final String gender;
  final String role;
  final String whom;
  final String verify;
  final String about;
  final String aboutTeacher;
  final dynamic lang;
  final String photo;
  final int code;
  final String balance;
  final bool isOnline;
  @EventEntityConverter()
  final EventEntity event;
  @RatingEntityConverter()
  final RatingEntity rating;
  final bool isFavourite;
  final bool isActiveFreeTrail;

  const TutorsEntity({
    this.id = 0,
    this.note = '',
    this.isActive = false,
    this.isDeleted = false,
    this.createdAt = '',
    this.lastEditedAt = '',
    this.deletedAt = '',
    this.displayname = '',
    this.rejectDescr = '',
    this.accent = '',
    this.address = '',
    this.currentAddress = '',
    this.firstname = '',
    this.lastname = '',
    this.email = '',
    this.birthday = '',
    this.googleId = '',
    this.facebookId = '',
    this.appleId = '',
    this.password = '',
    this.phone = '',
    this.introVideo = '',
    this.gender = '',
    this.role = '',
    this.whom = '',
    this.verify = '',
    this.about = '',
    this.aboutTeacher = '',
    this.lang = '',
    this.photo = '',
    this.code = 0,
    this.balance = '',
    this.isOnline = false,
    this.event = const EventEntity(),
    this.rating = const RatingEntity(),
    this.isFavourite = false,
    this.isActiveFreeTrail = false,
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
        displayname,
        rejectDescr,
        accent,
        address,
        currentAddress,
        firstname,
        lastname,
        email,
        birthday,
        googleId,
        facebookId,
        appleId,
        password,
        phone,
        introVideo,
        gender,
        role,
        whom,
        verify,
        about,
        aboutTeacher,
        lang,
        photo,
        code,
        balance,
        isOnline,
        event,
        rating,
        isFavourite,
        isActiveFreeTrail,
      ];
}

class TutorsEntityConverter implements JsonConverter<TutorsEntity, Map<String, dynamic>?> {
  const TutorsEntityConverter();
  @override
  TutorsEntity fromJson(Map<String, dynamic>? json) => TutorsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(TutorsEntity object) => {};
}
