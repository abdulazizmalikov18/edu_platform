part of 'courses_bloc.dart';

class CoursesState extends Equatable {
  final FormzStatus status;
  final List<CoursesEntity> courseList;

  const CoursesState({
    this.status = FormzStatus.pure,
    this.courseList = const [],
  });

  CoursesState copyWith({
    FormzStatus? status,
    List<CoursesEntity>? courseList,
  }) =>
      CoursesState(
        status: status ?? this.status,
        courseList: courseList ?? this.courseList,
      );

  @override
  List<Object> get props => [status, courseList];
}
