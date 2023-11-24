import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String avatar;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: '${json["first_name"]} ${json["last_name"]} ',
      email: json["email"],
      avatar: json["avatar"],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, avatar];
}
