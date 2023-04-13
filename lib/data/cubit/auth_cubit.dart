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

  void uploadPhoto(File img, String uid) async {
    emit(AuthLoading());
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = UserService().userStorage.child(uid).child(fileName);

      final UploadTask uploadTask = ref.putFile(img);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = await downloadUrl.ref.getDownloadURL();

      final User? user = UserService().auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(url);
        // ** update user data here
        final ref = UserService().userReference.doc(uid);
        ref.update({'photoUrl': url});
      }
      emit(AuthSuccess());
    } on FirebaseException catch (e) {
      emit(AuthFailed(e.message.toString()));
    }
  }

  void loginWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await UserService()
          .auth
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.message!));
    }
  }

  void signUpWithEmail(
      String name, String email, String password, String? about) async {
    emit(AuthLoading());
    try {
      final credential = await UserService()
          .auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user;

      if (user != null) {
        await user.updateDisplayName(name);
        final dataUser = ChatUser(
            id: user.uid,
            username: name,
            photoUrl: null,
            about: user.email.toString());
        final ref = UserService().userReference.doc(dataUser.id);
        ref.set(dataUser.toMap());
      }
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    emit(AuthLoading());
    try{
      await UserService().auth.signOut();
      emit(AuthSuccess());
    }on FirebaseAuthException catch(e){
      emit(AuthFailed(e.message.toString()));
    }
  }
}
