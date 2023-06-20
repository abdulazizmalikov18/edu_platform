import 'package:edu_platform/features/common/data/models/data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DataEntity extends Equatable {
  const DataEntity({
    this.id = 0,
    this.note = '',
    this.isActive = false,
    this.isDeleted = false,
    this.createdAt = "",
    this.lastEditedAt = "",
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
    this.balance = '',
    this.isOnline = false,
    this.token = '',
  });

  final int id;
  final dynamic note;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String lastEditedAt;
  final dynamic deletedAt;
  final dynamic displayname;
  final dynamic rejectDescr;
  final dynamic accent;
  final dynamic address;
  final dynamic currentAddress;
  final String firstname;
  final dynamic lastname;
  final String email;
  final dynamic birthday;
  final dynamic googleId;
  final dynamic facebookId;
  final dynamic appleId;
  final String phone;
  final dynamic introVideo;
  final String gender;
  final String role;
  final String whom;
  final String verify;
  final dynamic about;
  final dynamic aboutTeacher;
  final dynamic lang;
  final dynamic photo;
  final String balance;
  final bool isOnline;
  final String token;

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
        balance,
        isOnline,
        token,
      ];
}

class DataEntityConverter
    implements JsonConverter<DataEntity, Map<String, dynamic>?> {
  const DataEntityConverter();

  @override
  DataEntity fromJson(Map<String, dynamic>? json) =>
      DataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(DataEntity object) => {};
}
