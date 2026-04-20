class SignInUserModel {
  final String username, pass;

  SignInUserModel({required this.username, required this.pass});

  factory SignInUserModel.fromJson(Map<String, dynamic> json) {
    return SignInUserModel(username: json["username"], pass: json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "password": pass};
  }
}
