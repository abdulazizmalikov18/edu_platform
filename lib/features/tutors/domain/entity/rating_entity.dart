import 'package:edu_platform/features/tutors/data/models/rating_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RatingEntity extends Equatable {
  final int ball;
  final int count;

  const RatingEntity({
    this.ball = 0,
    this.count = 0,
  });

  @override
  List<Object?> get props => [ball, count];
}

class RatingEntityConverter implements JsonConverter<RatingEntity, Map<String, dynamic>?> {
  const RatingEntityConverter();
  @override
  RatingEntity fromJson(Map<String, dynamic>? json) => RatingModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(RatingEntity object) => {};
}
