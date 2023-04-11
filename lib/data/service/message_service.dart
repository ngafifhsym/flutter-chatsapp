import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MessageService{
  CollectionReference messageRef = FirebaseFirestore.instance.collection('chat');

  Reference chatStorage = FirebaseStorage.instance.ref('chat');
}