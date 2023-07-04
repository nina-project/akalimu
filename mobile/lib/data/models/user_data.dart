// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:akalimu/data/models/category.dart';
// import 'package:akalimu/data/models/client.dart';

// class UserData {
//   final int? id;
//   final String name;
//   final String email;
//   final String password;
//   final String? phoneNumber;
//   final String? accessToken;

//   String? city;
//   String? country;
//   List<Category> categories;
//   DateTime? emailVerifiedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   UserData({
//     this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     this.phoneNumber,
//     this.accessToken,
//     this.city,
//     this.country,
//     this.categories = const [],
//     this.emailVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//   });

//   UserData copyWith({
//     int? id,
//     String? name,
//     String? email,
//     String? password,
//     String? phoneNumber,
//     String? token,
//     String? city,
//     String? country,
//     List<Category>? categories,
//     DateTime? emailVerifiedAt,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return UserData(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       accessToken: token ?? accessToken,
//       city: city ?? this.city,
//       country: country ?? this.country,
//       categories: categories ?? this.categories,
//       emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'phone_number': phoneNumber,
//       'access_token': accessToken,
//       "city": city,
//       "country": country,
//       "categories": categories,
//       "email_verified_at": emailVerifiedAt?.toIso8601String(),
//       "created_at": createdAt?.toIso8601String(),
//       "updated_at": updatedAt?.toIso8601String(),
//     };
//   }

//   factory UserData.fromMap(Map<String, dynamic> map) {
//     return UserData(
//       id: map['id'] as int?,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       password: map['password'] as String,
//       phoneNumber: map['phone_number'] as String?,
//       accessToken: map['access_token'] as String?,
//       city: map["city"],
//       country: map["country"],
//       categories: map["categories"] ?? [],
//       emailVerifiedAt: DateTime.tryParse(map["email_verified_at"] ?? ""),
//       createdAt: DateTime.tryParse(map["created_at"] ?? ""),
//       updatedAt: DateTime.tryParse(map["updated_at"] ?? ""),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserData.fromJson(String source) =>
//       UserData.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return '''UserData(id: $id, name: $name, email: $email, password: $password, phone_nunber: $phoneNumber, access_token: $accessToken,
//     city: $city, country: $country, categories: $categories, email_verified_at: $emailVerifiedAt, created_at: $createdAt, updated_at: $updatedAt)''';
//   }

//   @override
//   bool operator ==(covariant UserData other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.email == email &&
//         other.password == password &&
//         other.phoneNumber == phoneNumber &&
//         other.accessToken == accessToken;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         email.hashCode ^
//         password.hashCode ^
//         phoneNumber.hashCode ^
//         accessToken.hashCode;
//   }
// }

// //generate UserData object from client object
// UserData _userDataFromClient(Client client) => UserData(
//       id: client.id,
//       name: client.name,
//       email: client.email,
//       password: "",
//       phoneNumber: client.phoneNumber,
//       city: client.city,
//       country: client.country,
//       categories: client.categories,
//       emailVerifiedAt: client.emailVerifiedAt,
//       createdAt: client.createdAt,
//       updatedAt: client.updatedAt,
//     );

// List<UserData> usersFromJson(String str) =>
//     List<UserData>.from(json.decode(str)['data'].map((x) {
//       Client dbUserData = Client.fromMap(x as Map<String, dynamic>);
//       return _userDataFromClient(dbUserData);
//     }).toList());
