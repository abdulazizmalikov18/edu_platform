part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final FormzStatus status;
  final List<TutorsEntity> chatList;
  const ChatState({
    this.status = FormzStatus.pure,
    this.chatList = const [],
  });

  ChatState copyWith({
    FormzStatus? status,
    List<TutorsEntity>? chatList,
  }) =>
      ChatState(
        status: status ?? this.status,
        chatList: chatList ?? this.chatList,
      );

  @override
  List<Object> get props => [
        status,
        chatList,
      ];
}
