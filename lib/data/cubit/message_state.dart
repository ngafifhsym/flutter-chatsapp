part of 'message_cubit.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {
  @override
  List<Object> get props => [];
}

class MessageSuccess extends MessageState{
  final List<ChatMessage> messages;
  const MessageSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessageFailed extends MessageState{
  final String error;

  const MessageFailed(this.error);

  @override
  List<Object> get props => [error];
}
