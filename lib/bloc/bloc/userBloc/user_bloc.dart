import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/User.dart';
import 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<AddUsers>(_onAddUser);
    on<UpdateUsers>(_onUpdateUser);
    on<DeleteUsers>(_onDeleteUser);
  }

  Future<FutureOr<void>> _onAddUser(
      AddUsers event, Emitter<UserState> emit) async {
    final state = this.state;
    emit(UserState(allUsers: List.from(state.allUsers)..add(event.users)));

    final item = User(
        id: event.users.id,
        firstName: event.users.firstName,
        phoneNumber: event.users.phoneNumber,
        email: event.users.email);

    try {
      print('Succesfully save of user!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline user not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateUser(
      UpdateUsers event, Emitter<UserState> emit) async {
    final state = this.state;
    final user = event.users;
    final index = state.allUsers.indexOf(user);
    //update Locale storage
    List<User> alluser = List.from(state.allUsers)..remove(user);
    alluser.insert(
        index, user.copyWith());
  }

  FutureOr<void> _onDeleteUser(DeleteUsers event, Emitter<UserState> emit) {
    
  }
}
