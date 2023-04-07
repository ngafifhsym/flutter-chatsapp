import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final String id;
  final String username;
  final String photoUrl;
  final String about;

  const ChatUser({
    required this.id,
    this.username = '',
    this.photoUrl = '',
    this.about = '',
  });

  factory ChatUser.fromMap(String id, Map<String, dynamic> json) {
    return ChatUser(
      id: id,
      username: json['username'] as String,
      photoUrl: json['foto'] as String,
      about: json['email'] as String,
    );
  }

  @override
  List<Object?> get props => [id, username, photoUrl, about];
}
