part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailUserEvent extends DetailEvent {
  final int id;

  const GetDetailUserEvent(this.id);
  @override
  List<Object> get props => [id];
}
