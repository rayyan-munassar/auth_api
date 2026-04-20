class AddUserModel {
  final String username, email, password;

  AddUserModel({
    required this.username,
    required this.email,
    required this.password,
  });

  factory AddUserModel.fromJson(Map<String, dynamic> json) {
    return AddUserModel(
      username: json["username"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "email": email, "password": password};
  }
}
