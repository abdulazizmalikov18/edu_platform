import 'package:equatable/equatable.dart';

class CoursesEntity extends Equatable {
  final int id;
  final dynamic note;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String lastEditedAt;
  final dynamic deletedAt;
  final String name;
  final String image;
  final String descr;
  final String overview;
  final String result;
  final String presentation;
  final String level;
  final int term;
  // @PlanCoursesConverter()
  // final List<PlanCoursesEntity> plan;

  const CoursesEntity({
    this.id = 0,
    this.note = '',
    this.isActive = false,
    this.isDeleted = false,
    this.createdAt = '',
    this.lastEditedAt = '',
    this.deletedAt = '',
    this.name = '',
    this.image = '',
    this.descr = '',
    this.overview = '',
    this.result = '',
    this.presentation = '',
    this.level = '',
    this.term = 0,
    // this.plan = const [],
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
        name,
        image,
        descr,
        overview,
        result,
        presentation,
        level,
        term,
        // plan,
      ];
}
