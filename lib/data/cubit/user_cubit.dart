import 'package:bloc/bloc.dart';
import 'package:chatapp/data/service/user_service.dart';
import 'package:equatable/equatable.dart';

import '../model/chat_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void fetchUsers() async {
    try{
      emit(UserLoading());

      List<ChatUser> users = await UserService().fetchUsers();
      
      emit(UserSuccess(users));
    }catch(e){
      emit(UserFailed(e.toString()));
    }
  }
}
