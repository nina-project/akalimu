// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'category.dart';

class Job {
  Job({
    this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.postedBy,
    required this.wage,
    this.categories = const [],
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String title;
  final String? location;
  final String? description;
  final int postedBy;
  final int wage;
  List<Category> categories;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Job copyWith({
    String? location,
    DateTime? createdAt,
    String? description,
    int? id,
    String? title,
    int? postedBy,
    int? wage,
    List<Category>? categories,
    DateTime? updatedAt,
  }) {
    return Job(
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      id: id ?? this.id,
      postedBy: postedBy ?? this.postedBy,
      wage: wage ?? this.wage,
      title: title ?? this.title,
      categories: categories ?? this.categories,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'wage': wage,
      'posted_by': postedBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'categories': categories.map((e) => e.id).toList(),
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String?,
      location: map['location'] as String?,
      wage: map['wage'] as int,
      postedBy: map['posted_by'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      categories: (map['categories'] as List<dynamic>?)?.map((e) {
            if (e is int) {
              return Category(id: e, name: "");
            }
            return Category.fromMap(e as Map<String, dynamic>);
          }).toList() ??
          [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job(location: $location, \ncreated_at: $createdAt, \ndescription: $description, id: $id, \nposted_by: $postedBy, wage: $wage, \ntitle: $title, categories: $categories, updated_at: $updatedAt)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;

    return other.location == location &&
        other.createdAt == createdAt &&
        other.description == description &&
        other.id == id &&
        other.postedBy == postedBy &&
        other.wage == wage &&
        other.title == title &&
        other.categories == categories &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return location.hashCode ^
        createdAt.hashCode ^
        description.hashCode ^
        id.hashCode ^
        postedBy.hashCode ^
        wage.hashCode ^
        title.hashCode ^
        categories.hashCode ^
        updatedAt.hashCode;
  }
}

List<Job> jobsFromJson(String source) {
  final jsonResponse = json.decode(source);
  final List<dynamic> jobsList = jsonResponse['data'] as List<dynamic>;
  return jobsList.map((jobJson) {
    return Job.fromMap(jobJson);
  }).toList();
}
