import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/features/messages/domain/usecase/chat_usecase.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatUseUseCase useCase = ChatUseUseCase();
  ChatBloc() : super(const ChatState()) {
    on<GetChat>((event, emit) async {
      if (state.chatList.isEmpty) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }
      final result = await useCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          chatList: result.right.data,
          status: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
