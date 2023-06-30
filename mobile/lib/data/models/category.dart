import 'dart:convert';

class Category {
  Category({
    this.createdAt,
    required this.id,
    required this.name,
    this.updatedAt,
  });

  DateTime? createdAt;
  int id;
  String name;
  DateTime? updatedAt;

  factory Category.fromMap(Map<String, dynamic> map) => Category(
        createdAt: DateTime.parse(map["created_at"]),
        id: map["id"],
        name: map["name"],
        updatedAt: DateTime.parse(map["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Category> categoriesFromJson(String str) => List<Category>.from(
    json.decode(str)['data'].map((x) => Category.fromMap(x)));
