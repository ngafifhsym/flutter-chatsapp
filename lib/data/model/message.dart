import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable{
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final String timestamp;
  final String? imageUrl;

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    this.imageUrl
  });

  factory ChatMessage.fromMap(String id, Map<String, dynamic> map) {
    return ChatMessage(
      id: id,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as String,
      imageUrl: map['imageUrl'] as String?
    );
  }

  @override
  List<Object?> get props => [id, senderId, receiverId, message, timestamp];

}