import 'package:chatapp/data/model/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference userRef = FirebaseFirestore.instance.collection('akun');

  Future<List<ChatUser>> fetchUsers() async {
    try {
      QuerySnapshot result = await userRef.get();

      List<ChatUser> users = result.docs.map((e) {
        return ChatUser.fromMap(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return users;
    } catch (e) {
      rethrow;
    }
  }
}
