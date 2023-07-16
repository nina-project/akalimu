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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      createdAt: map.containsKey("created_at")
          ? DateTime.parse(map["created_at"])
          : null,
      id: map.containsKey("id") ? map["id"] : 0,
      name: map["name"],
      updatedAt: map.containsKey("updated_at")
          ? DateTime.parse(map["updated_at"])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "id": id,
        "name": name,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(createdAt: $createdAt, id: $id, name: $name, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.createdAt == createdAt &&
        other.id == id &&
        other.name == name &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        id.hashCode ^
        name.hashCode ^
        updatedAt.hashCode;
  }
}

List<Category> categoriesFromJson(String str) => List<Category>.from(
    json.decode(str)['data'].map((x) => Category.fromMap(x)));
