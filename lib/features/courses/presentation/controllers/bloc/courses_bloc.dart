import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/features/courses/domain/entity/courses_entity.dart';
import 'package:edu_platform/features/courses/domain/usecase/courses_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesUseUseCase useCase = CoursesUseUseCase();
  CoursesBloc() : super(const CoursesState()) {
    on<GetCourses>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          courseList: result.right.data,
          status: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
