class DomainUser {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isActive;
  DateTime? joiningDate;
  String? token;
  DateTime? expireAt;

  DomainUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isActive,
    this.joiningDate,
    this.token,
    this.expireAt,
  });

  factory DomainUser.fromJson(Map<String, dynamic> json) => DomainUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        isActive: json["is_active"],
        joiningDate: json["joining_date"] == null
            ? null
            : DateTime.parse(json["joining_date"]),
        token: json["token"],
        expireAt: json["expire_at"] == null
            ? null
            : DateTime.parse(json["expire_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "is_active": isActive,
        "joining_date":
            "${joiningDate!.year.toString().padLeft(4, '0')}-${joiningDate!.month.toString().padLeft(2, '0')}-${joiningDate!.day.toString().padLeft(2, '0')}",
        "token": token,
        "expire_at": expireAt?.toIso8601String(),
      };
}
