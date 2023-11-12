class UserModel {
  final String message;
  final UserData data;

  UserModel({required this.message, required this.data});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json["message"],
      data: UserData.fromJson(json["data"]),
    );
  }
}

class UserData {
  final String id;
  final String userName;
  final String email;

  UserData({required this.id, required this.userName, required this.email});
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["_id"],
      userName: json["userName"],
      email: json["email"],
    );
  }
}