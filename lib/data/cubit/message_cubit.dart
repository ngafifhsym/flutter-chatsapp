import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:chatapp/data/service/message_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../model/message.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  StreamSubscription? _streamSubscription;

  Stream<List<ChatMessage>> _messageStream(String chatId) => MessageService()
      .messageRef
      .doc(chatId)
      .collection('messages')
      .orderBy('timestamp')
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((doc) => ChatMessage.fromMap(doc.id, doc.data()))
          .toList());

  void fetchChatMessage(String groupChatId) async {
    try {
      emit(MessageLoading());

      _streamSubscription?.cancel();

      _streamSubscription = _messageStream(groupChatId).listen(
          (data) => emit(MessageSuccess(data)),
          onError: (error) => emit(MessageFailed(error.toString())));
    } catch (e) {
      emit(MessageFailed(e.toString()));
    }
  }

  Future<void> addMessage(String chatId, String senderId, String receiverId,
      String message, String timestamp) async {
    DocumentReference docRef = MessageService()
        .messageRef
        .doc(chatId)
        .collection('messages')
        .doc(timestamp);

    final Map<String, dynamic> messages = {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp
    };
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(docRef, messages);
      });
    } catch (e) {
      developer.log(e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
