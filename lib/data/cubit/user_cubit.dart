import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatapp/data/service/user_service.dart';
import 'package:equatable/equatable.dart';

import '../model/chat_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  StreamSubscription? _streamSubscription;

  final Stream<List<ChatUser>> _streamUsers = UserService()
      .userRef
      .snapshots()
      .map(
        (querySnapshot) => querySnapshot.docs
            .map((doc) =>
                ChatUser.fromMap(doc.id, doc.data() as Map<String, dynamic>))
            .toList(),
      );

  // ** fetch users
  void fetchUsers() async {
    try {
      emit(UserLoading());

      // ** cancel latest stream
      _streamSubscription?.cancel();

      _streamSubscription = _streamUsers.listen(
        (data) => emit(UserSuccess(data)),
        onError: (error) => emit(UserFailed(error.toString())),
      );
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  // ** close the stream
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
