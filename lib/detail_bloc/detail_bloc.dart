import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learn_bloc/api.dart';
import 'package:flutter_learn_bloc/model.dart';
import 'package:flutter_learn_bloc/user_bloc/user_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState.initial()) {
    on<GetDetailUserEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DetailStateStatus.loading));
        final result = await ApiService.getUsersById(event.id);
        emit(state.copyWith(status: DetailStateStatus.success, user: result));
      } catch (e) {
        emit(state.copyWith(status: DetailStateStatus.failure));
      }
    });
  }
}
