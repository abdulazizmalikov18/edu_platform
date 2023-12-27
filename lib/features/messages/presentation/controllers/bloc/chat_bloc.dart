import 'package:edu_platform/core/usecases/usecase.dart';
import 'package:edu_platform/features/messages/domain/entity/create_mesage.dart';
import 'package:edu_platform/features/messages/domain/entity/filter_messages.dart';
import 'package:edu_platform/features/messages/domain/entity/messages_entity.dart';
import 'package:edu_platform/features/messages/domain/usecase/chat_usecase.dart';
import 'package:edu_platform/features/messages/domain/usecase/create_message.dart';
import 'package:edu_platform/features/messages/domain/usecase/messages_usecase.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatUseUseCase useCase = ChatUseUseCase();
  MessagesUseCase messagesUseCase = MessagesUseCase();
  CreateMessageUseCase createMessageUseCase = CreateMessageUseCase();
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
    on<CreateMessageEvent>((event, emit) async {
      emit(state.copyWith(statusMessageCreate: FormzStatus.submissionInProgress));
      final param = CreateMessage(id: event.id, message: event.message);
      final result = await createMessageUseCase.call(param);
      if (result.isRight) {
        add(GetMessages(id: event.id, onSucces: event.onSucces));
        emit(state.copyWith(statusMessageCreate: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(statusMessageCreate: FormzStatus.submissionFailure));
      }
    });

    on<GetMessages>((event, emit) async {
      if (state.messagesList.isEmpty) {
        emit(state.copyWith(statusMessage: FormzStatus.submissionInProgress));
      }
      final param = MessageFilter(
        id: event.id,
        dateFrom: "2023-01-01",
        dateTo: "2024-01-01",
      );
      final result = await messagesUseCase.call(param);
      if (result.isRight) {
        emit(state.copyWith(
          messagesList: result.right.data,
          statusMessage: FormzStatus.submissionSuccess,
        ));
        if (event.onSucces != null) {
          event.onSucces!();
        }
      } else {
        emit(state.copyWith(statusMessage: FormzStatus.submissionFailure));
      }
    });
  }
}
