import 'dart:developer' as developer;
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chatapp/data/model/chat_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../service/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());



  Future<String?> uploadPhoto(File? img, String uid) async {
    if (img == null) return null;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = UserService().userStorage.child(uid).child(fileName);

    try {
      await ref.putFile(img);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      developer.log(e.toString());
      return null;
    }
  }

  void signUpWithEmail(String name, String email, String password, File? img,
      String? about) async {
    emit(AuthLoading());
    try {
      final credential = await UserService()
          .auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user;

      if (user != null) {
        final imgUrl = uploadPhoto(img, user.uid);
        user.updateDisplayName(name);
        user.updatePhotoURL(imgUrl.toString());
        final dataUser = ChatUser(
            id: user.uid,
            username: name,
            photoUrl: imgUrl.toString(),
            about: user.email.toString());
        final ref = UserService().userReference.doc(dataUser.id);
        ref.set(dataUser.toMap());
        emit(AuthSuccess(dataUser));
      } else {
        emit(AuthFailed('Data user tidak ada'));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    await UserService().auth.signOut();
  }
}
