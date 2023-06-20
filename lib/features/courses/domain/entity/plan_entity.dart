import 'package:edu_platform/features/courses/data/models/plan_courses_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class PlanCoursesEntity extends Equatable {
  const PlanCoursesEntity({
    this.syllabus = '',
  });

  final String syllabus;

  @override
  List<Object?> get props => [syllabus];
}

class PlanCoursesConverter
    implements JsonConverter<PlanCoursesEntity, Map<String, dynamic>?> {
  const PlanCoursesConverter();
  @override
  PlanCoursesEntity fromJson(Map<String, dynamic>? json) =>
      PlanCoursesModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(PlanCoursesEntity object) => {};
}
