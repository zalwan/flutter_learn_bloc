import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learn_bloc/api.dart';
import 'package:flutter_learn_bloc/model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetListUserEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final result = await ApiService.getUsers();
        emit(UserSuccess(users: result));
      } catch (e) {
        emit(UserFailure());
      }
    });
  }
}
