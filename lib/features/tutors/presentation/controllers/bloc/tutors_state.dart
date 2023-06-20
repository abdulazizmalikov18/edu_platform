part of 'tutors_bloc.dart';

class TutorsState extends Equatable {
  final List<TutorsEntity> tutorsList;
  final List<TutorsEntity> tutorsFavoriteList;
  final FormzStatus status;

  const TutorsState({
    this.status = FormzStatus.pure,
    this.tutorsList = const [],
    this.tutorsFavoriteList = const [],
  });

  TutorsState copyWith(
          {FormzStatus? status,
          List<TutorsEntity>? tutorsList,
          List<TutorsEntity>? tutorsFavoriteList}) =>
      TutorsState(
        status: status ?? this.status,
        tutorsList: tutorsList ?? this.tutorsList,
        tutorsFavoriteList: tutorsFavoriteList ?? this.tutorsFavoriteList,
      );

  @override
  List<Object> get props => [
        status,
        tutorsList,
        tutorsFavoriteList,
      ];
}
