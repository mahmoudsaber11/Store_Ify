import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String message;
  final UserData userData;

  const UserModel({
    required this.message,
    required this.userData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
