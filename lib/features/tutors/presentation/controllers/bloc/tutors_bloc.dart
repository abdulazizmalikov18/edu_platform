import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:edu_platform/features/tutors/domain/usecase/tutors_favorite_list.dart';
import 'package:edu_platform/features/tutors/domain/usecase/tutors_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'tutors_event.dart';
part 'tutors_state.dart';

class TutorsBloc extends Bloc<TutorsEvent, TutorsState> {
  TutorsUseUseCase useCase = TutorsUseUseCase();
  TutorsFavoriteUseCase favoriteUseCase = TutorsFavoriteUseCase();
  TutorsBloc() : super(const TutorsState()) {
    on<GetTutors>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            tutorsList: result.right.data,
            status: FormzStatus.submissionSuccess,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<GetFavoriteTutors>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await favoriteUseCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            tutorsFavoriteList: result.right.data,
            status: FormzStatus.submissionSuccess,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
