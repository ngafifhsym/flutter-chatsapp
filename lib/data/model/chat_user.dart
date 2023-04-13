import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final String id;
  final String? username;
  final String? photoUrl;
  final String? about;

  const ChatUser({
    required this.id,
    this.username,
    this.photoUrl,
    this.about,
  });



  @override
  List<Object?> get props => [id, username, photoUrl, about];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'photoUrl': photoUrl,
      'about': about,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'] as String,
      username: json['username'] as String?,
      photoUrl: json['photoUrl'] as String?,
      about: json['about'] as String?,
    );
  }
}
