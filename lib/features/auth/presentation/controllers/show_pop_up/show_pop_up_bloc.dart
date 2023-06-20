import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_pop_up_event.dart';

part 'show_pop_up_state.dart';

enum PopStatus { success, error, warning }

class ShowPopUpBloc extends Bloc<ShowPopUpEvent, ShowPopUpState> {
  ShowPopUpBloc()
      : super(const ShowPopUpState(
          status: PopStatus.success,
          message: '',
          showPopUp: false,
        )) {
    var timer = Timer(Duration.zero, () {});
    on<ShowPopUp>((event, emit) {
      emit(state.copyWith(
          message: event.message, showPopUp: true, status: event.status));
      if (timer.isActive) {
        timer.cancel();
      }
      timer = Timer(const Duration(seconds: 3), () {
        if (event.dismissible) {
          add(HidePopUp());
        }
      });
    });
    on<HidePopUp>((event, emit) {
      if (timer.isActive) {
        timer.cancel();
      }
      emit(state.copyWith(message: '', showPopUp: false));
    });
  }
}
