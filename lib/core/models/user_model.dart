class UserModel {
  final String message;
  final UserData userData;

  UserModel({required this.message, required this.userData});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: message,
      userData: userData,
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
