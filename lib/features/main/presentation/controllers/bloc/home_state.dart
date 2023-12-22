part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzStatus statusUpcoming;
  final FormzStatus statusLive;
  final FormzStatus statusCompleted;
  final FormzStatus statusNeed;
  final List<EventUserEntity> eventsUpcoming;
  final List<EventUserEntity> eventsLive;
  final List<EventUserEntity> eventsCompleted;
  final List<EventUserEntity> eventsNeed;
  const HomeState({
    this.statusUpcoming = FormzStatus.pure,
    this.statusLive = FormzStatus.pure,
    this.statusCompleted = FormzStatus.pure,
    this.statusNeed = FormzStatus.pure,
    this.eventsUpcoming = const [],
    this.eventsLive = const [],
    this.eventsCompleted = const [],
    this.eventsNeed = const [],
  });

  HomeState copyWith({
    FormzStatus? statusUpcoming,
    FormzStatus? statusLive,
    FormzStatus? statusCompleted,
    FormzStatus? statusNeed,
    List<EventUserEntity>? eventsUpcoming,
    List<EventUserEntity>? eventsLive,
    List<EventUserEntity>? eventsCompleted,
    List<EventUserEntity>? eventsNeed,
  }) =>
      HomeState(
        statusUpcoming: statusUpcoming ?? this.statusUpcoming,
        statusLive: statusLive ?? this.statusLive,
        statusCompleted: statusCompleted ?? this.statusCompleted,
        statusNeed: statusNeed ?? this.statusNeed,
        eventsUpcoming: eventsUpcoming ?? this.eventsUpcoming,
        eventsLive: eventsLive ?? this.eventsLive,
        eventsCompleted: eventsCompleted ?? this.eventsCompleted,
        eventsNeed: eventsNeed ?? this.eventsNeed,
      );

  @override
  List<Object> get props => [
        statusUpcoming,
        statusLive,
        statusCompleted,
        statusNeed,
        eventsUpcoming,
        eventsLive,
        eventsCompleted,
        eventsNeed,
      ];
}
