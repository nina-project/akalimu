import 'dart:convert';

import 'package:akalimu/data/models/category.dart';

class Client {
  Client({
    this.city,
    this.country,
    required this.email,
    this.phoneNumber,
    this.interests = const [],
    this.emailVerifiedAt,
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String? phoneNumber;
  String? city;
  String? country;
  List<Category> interests;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Client.fromMap(Map<String, dynamic> map) => Client(
        city: map["city"],
        country: map["country"],
        createdAt: DateTime.parse(map["created_at"]),
        email: map["email"],
        phoneNumber: map["phone_number"],
        interests: map["interests"] == null
            ? <Category>[]
            : List<Category>.from(map["interests"].map((x) {
                try {
                  return Category.fromMap(x);
                } catch (e) {
                  return Category.fromJson(x);
                }
              })),
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
        "interests": interests,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
        "id": id,
        "name": name,
        "updated_at": updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toMapForUpdate() => {
        "city": city,
        "country": country,
        "email": email,
        "phone_number": phoneNumber,
        "interests": interests.map((e) => e.id).toList(),
        "name": name,
        "updated_at": updatedAt.toIso8601String(),
      };

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

  Client copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? city,
    String? country,
    List<Category>? interests,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      country: country ?? this.country,
      interests: interests ?? this.interests,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return '''UserData(id: $id, name: $name, email: $email, phone_nunber: $phoneNumber, city: $city, country: $country, 
    interests: $interests, email_verified_at: $emailVerifiedAt, created_at: $createdAt, updated_at: $updatedAt)''';
  }
}

List<Client> clientsFromJson(String str) => List<Client>.from(json
    .decode(str)['data']
    .map((x) => Client.fromMap(x as Map<String, dynamic>))
    .toList());
