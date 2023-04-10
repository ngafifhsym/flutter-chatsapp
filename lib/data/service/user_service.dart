import 'dart:ui';

import 'package:chatapp/data/model/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference userRef = FirebaseFirestore.instance.collection('akun');
}
