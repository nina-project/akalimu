import 'dart:convert';

class AuthObject {
  String? accessToken;
  String? name;
  String? email;
  String? password;
  AuthObject({
    this.accessToken,
    this.name,
    this.email,
    this.password,
  });

  AuthObject copyWith({
    String? accessToken,
    String? name,
    String? email,
    String? password,
  }) {
    return AuthObject(
      accessToken: accessToken ?? this.accessToken,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory AuthObject.fromMap(Map<String, dynamic> map) {
    return AuthObject(
      accessToken:
          map['access_token'] != null ? map['access_token'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthObject.fromJson(String source) =>
      AuthObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthObject(access_token: $accessToken, name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant AuthObject other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
