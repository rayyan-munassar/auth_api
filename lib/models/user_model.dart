class UserModel {
  String? username, email, firstName, lastName, gender, image;
  int? id;
  UserModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      id: json!["id"],
      username: json["username"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      gender: json["gender"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "image": image,
    };
  }
}
