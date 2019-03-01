
import 'dart:convert';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User {
  int id;
  String username;
  String name;
  String status;
  String token;

  User({
    this.id,
    this.username,
    this.name,
    this.status,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    status: json["status"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "status": status,
    "token": token,
  };
}
