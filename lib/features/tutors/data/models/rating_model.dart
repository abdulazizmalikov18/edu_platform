import 'package:edu_platform/features/tutors/domain/entity/rating_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel extends RatingEntity {
  const RatingModel({super.ball, super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
