import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService{
  CollectionReference messageRef = FirebaseFirestore.instance.collection('chat');
}