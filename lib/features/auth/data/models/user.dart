import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String message;
  final UserData userData;

  const User({
    required this.message,
    required this.userData,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      message: json["message"],
      userData: UserData.fromJson(json["data"]),
    );
  }

  @override
  List<Object?> get props => [message, userData];
}

class UserData extends Equatable {
  final String id;
  final String userName;
  final String email;

  const UserData({
    required this.id,
    required this.userName,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["_id"],
      userName: json["userName"],
      email: json["email"],
    );
  }

  @override
  List<Object?> get props => [id, userName, email];
}
