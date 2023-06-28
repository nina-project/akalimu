import 'dart:convert';

class Client {
  Client({
    this.city,
    this.country,
    required this.createdAt,
    required this.email,
    this.phoneNumber,
    this.emailVerifiedAt,
    required this.id,
    required this.name,
    required this.updatedAt,
  });

  String? city;
  String? country;
  DateTime createdAt;
  String email;
  String? phoneNumber;
  DateTime? emailVerifiedAt;
  int id;
  String name;
  DateTime updatedAt;

  factory Client.fromMap(Map<String, dynamic> map) => Client(
        city: map["city"],
        country: map["country"],
        createdAt: DateTime.parse(map["created_at"]),
        email: map["email"],
        phoneNumber: map["phone_number"],
        emailVerifiedAt: map["email_verified_at"] == null
            ? null
            : DateTime.parse(map["email_verified_at"]),
        id: map["id"],
        name: map["name"],
        updatedAt: DateTime.parse(map["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "city": city,
        "country": country,
        "created_at": createdAt.toIso8601String(),
        "email": email,
        "phone_number": phoneNumber,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
        "id": id,
        "name": name,
        "updated_at": updatedAt.toIso8601String(),
      };

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}

List<Client> clientsFromJson(String str) => List<Client>.from(json
    .decode(str)['data']
    .map((x) => Client.fromMap(x as Map<String, dynamic>))
    .toList());
