// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorsModel _$TutorsModelFromJson(Map<String, dynamic> json) => TutorsModel(
      id: json['id'] as int? ?? 0,
      note: json['note'] ?? '',
      isActive: json['isActive'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      lastEditedAt: json['lastEditedAt'] as String? ?? '',
      deletedAt: json['deletedAt'] ?? '',
      displayname: json['displayname'] as String? ?? '',
      rejectDescr: json['rejectDescr'] ?? '',
      accent: json['accent'] as String? ?? '',
      address: json['address'] as String? ?? '',
      currentAddress: json['currentAddress'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      birthday: json['birthday'] as String? ?? '',
      googleId: json['googleId'] ?? '',
      facebookId: json['facebookId'] ?? '',
      appleId: json['appleId'] ?? '',
      password: json['password'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      introVideo: json['introVideo'] ?? '',
      gender: json['gender'] as String? ?? '',
      role: json['role'] as String? ?? '',
      whom: json['whom'] as String? ?? '',
      verify: json['verify'] as String? ?? '',
      about: json['about'] as String? ?? '',
      aboutTeacher: json['aboutTeacher'] as String? ?? '',
      lang: json['lang'] ?? '',
      photo: json['photo'] as String? ?? '',
      code: json['code'] as int? ?? 0,
      balance: json['balance'] as String? ?? '',
      isOnline: json['isOnline'] as bool? ?? false,
      event: json['event'] == null
          ? const EventEntity()
          : const EventEntityConverter()
              .fromJson(json['event'] as Map<String, dynamic>?),
      rating: json['rating'] == null
          ? const RatingEntity()
          : const RatingEntityConverter()
              .fromJson(json['rating'] as Map<String, dynamic>?),
      isFavourite: json['isFavourite'] as bool? ?? false,
    );

Map<String, dynamic> _$TutorsModelToJson(TutorsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'lastEditedAt': instance.lastEditedAt,
      'deletedAt': instance.deletedAt,
      'displayname': instance.displayname,
      'rejectDescr': instance.rejectDescr,
      'accent': instance.accent,
      'address': instance.address,
      'currentAddress': instance.currentAddress,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'birthday': instance.birthday,
      'googleId': instance.googleId,
      'facebookId': instance.facebookId,
      'appleId': instance.appleId,
      'password': instance.password,
      'phone': instance.phone,
      'introVideo': instance.introVideo,
      'gender': instance.gender,
      'role': instance.role,
      'whom': instance.whom,
      'verify': instance.verify,
      'about': instance.about,
      'aboutTeacher': instance.aboutTeacher,
      'lang': instance.lang,
      'photo': instance.photo,
      'code': instance.code,
      'balance': instance.balance,
      'isOnline': instance.isOnline,
      'event': const EventEntityConverter().toJson(instance.event),
      'rating': const RatingEntityConverter().toJson(instance.rating),
      'isFavourite': instance.isFavourite,
    };
