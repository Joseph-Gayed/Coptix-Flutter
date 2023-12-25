import 'dart:convert';

String authRequestToJson(AuthRequest data) => json.encode(data.toJson());

class AuthRequest {
  String? name;
  String? email;
  String? mobile;
  String? password;

  AuthRequest({
    this.name,
    this.email,
    this.mobile,
    this.password,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        name: json["name"],
        email: json["email"],
        mobile: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        if (name != null) "name": name,
        if (email != null) "email": email,
        if (mobile != null) "phone": mobile,
        if (password != null) "password": password,
      };
}
