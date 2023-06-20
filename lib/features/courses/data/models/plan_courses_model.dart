import 'package:edu_platform/features/courses/domain/entity/plan_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_courses_model.g.dart';

@JsonSerializable()
class PlanCoursesModel extends PlanCoursesEntity {
  const PlanCoursesModel({
    super.syllabus,
  });

  factory PlanCoursesModel.fromJson(Map<String, dynamic> json) =>
      _$PlanCoursesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCoursesModelToJson(this);
}
