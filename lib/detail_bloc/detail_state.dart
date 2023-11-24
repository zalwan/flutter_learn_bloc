part of 'detail_bloc.dart';

enum DetailStateStatus { initial, loading, success, failure }

class DetailState extends Equatable {
  const DetailState({
    this.status = DetailStateStatus.initial,
    this.user,
  });

  factory DetailState.initial() {
    return DetailState();
  }

  final DetailStateStatus status;
  final UserModel? user;

  DetailState copyWith({
    DetailStateStatus? status,
    UserModel? user,
  }) {
    return DetailState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}
