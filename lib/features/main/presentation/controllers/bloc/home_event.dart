part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetEventsUpcoming extends HomeEvent {}

class GetEventsLive extends HomeEvent {}

class GetEventsCompleted extends HomeEvent {}

class GetEventsNeed extends HomeEvent {}
