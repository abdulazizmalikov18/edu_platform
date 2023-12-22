import 'package:edu_platform/core/utils/my_functions.dart';
import 'package:edu_platform/features/main/data/model/event_filter_model.dart';
import 'package:edu_platform/features/main/domain/entity/event_user_entity.dart';
import 'package:edu_platform/features/main/domain/usecase/event_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  EventUserUseCase useCase = EventUserUseCase();

  HomeBloc() : super(const HomeState()) {
    on<GetEventsUpcoming>((event, emit) async {
      emit(state.copyWith(statusUpcoming: FormzStatus.submissionInProgress));
      final param = EventFilter(
        statusName: 'bocked',
        dateFrom: MyFunctions.getDay(true),
        dateTo: MyFunctions.getDay(false),
      );
      final result = await useCase.call(param);
      if (result.isRight) {
        emit(state.copyWith(
          eventsUpcoming: result.right.data,
          statusUpcoming: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(statusUpcoming: FormzStatus.submissionFailure));
      }
    });
    on<GetEventsLive>((event, emit) async {
      emit(state.copyWith(statusLive: FormzStatus.submissionInProgress));
      final param = EventFilter(
        statusName: 'started',
        dateFrom: MyFunctions.getDay(true),
        dateTo: MyFunctions.getDay(false),
      );
      final result = await useCase.call(param);
      if (result.isRight) {
        emit(state.copyWith(
          eventsLive: result.right.data,
          statusLive: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(statusLive: FormzStatus.submissionFailure));
      }
    });
    on<GetEventsNeed>((event, emit) async {
      emit(state.copyWith(statusNeed: FormzStatus.submissionInProgress));
      final param = EventFilter(
        statusName: 'respond',
        dateFrom: MyFunctions.getDay(true),
        dateTo: MyFunctions.getDay(false),
      );
      final result = await useCase.call(param);
      if (result.isRight) {
        emit(state.copyWith(
          eventsNeed: result.right.data,
          statusNeed: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(statusNeed: FormzStatus.submissionFailure));
      }
    });
    on<GetEventsCompleted>((event, emit) async {
      emit(state.copyWith(statusCompleted: FormzStatus.submissionInProgress));
      final param = EventFilter(
        statusName: 'completed',
        dateFrom: MyFunctions.getDay(true),
        dateTo: MyFunctions.getDay(false),
      );
      final result = await useCase.call(param);
      if (result.isRight) {
        emit(state.copyWith(
          eventsCompleted: result.right.data,
          statusCompleted: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(statusCompleted: FormzStatus.submissionFailure));
      }
    });
  }
}
