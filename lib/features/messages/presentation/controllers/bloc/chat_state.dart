part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final FormzStatus status;
  final FormzStatus statusMessage;
  final FormzStatus statusMessageCreate;
  final List<TutorsEntity> chatList;
  final List<MessagesEntity> messagesList;
  const ChatState({
    this.status = FormzStatus.pure,
    this.statusMessage = FormzStatus.pure,
    this.statusMessageCreate = FormzStatus.pure,
    this.chatList = const [],
    this.messagesList = const [],
  });

  ChatState copyWith({
    FormzStatus? status,
    FormzStatus? statusMessage,
    FormzStatus? statusMessageCreate,
    List<TutorsEntity>? chatList,
    List<MessagesEntity>? messagesList,
  }) =>
      ChatState(
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        statusMessageCreate: statusMessageCreate ?? this.statusMessageCreate,
        chatList: chatList ?? this.chatList,
        messagesList: messagesList ?? this.messagesList,
      );

  @override
  List<Object> get props => [
        status,
        statusMessage,
        statusMessageCreate,
        chatList,
        messagesList,
      ];
}
