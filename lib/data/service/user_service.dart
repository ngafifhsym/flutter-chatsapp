import 'dart:ui';

import 'package:chatapp/data/model/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService {
  CollectionReference userRef = FirebaseFirestore.instance.collection('akun');

  CollectionReference userReference = FirebaseFirestore.instance.collection('user');

  FirebaseAuth auth = FirebaseAuth.instance;

  Reference userStorage = FirebaseStorage.instance.ref('user');
}
