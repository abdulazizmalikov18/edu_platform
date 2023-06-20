import 'package:edu_platform/features/courses/domain/entity/courses_entity.dart';
import 'package:edu_platform/features/courses/domain/entity/plan_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'courses_model.g.dart';

@JsonSerializable()
class CoursesModel extends CoursesEntity {
  const CoursesModel({
    super.id,
    super.note,
    super.isActive,
    super.isDeleted,
    super.createdAt,
    super.lastEditedAt,
    super.deletedAt,
    super.name,
    super.image,
    super.descr,
    super.overview,
    super.result,
    super.presentation,
    super.level,
    super.term,
    // super.plan,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesModelToJson(this);
}
