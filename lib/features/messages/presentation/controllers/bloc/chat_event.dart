part of 'chat_bloc.dart';

abstract class ChatEvent {}

class GetChat extends ChatEvent {}

class GetMessages extends ChatEvent {
  final int id;
  final VoidCallback? onSucces;

  GetMessages({
    required this.id,
    this.onSucces,
  });
}

class CreateMessageEvent extends ChatEvent {
  final int id;
  final String message;
  final VoidCallback onSucces;

  CreateMessageEvent({
    required this.id,
    required this.message,
    required this.onSucces,
  });
}
