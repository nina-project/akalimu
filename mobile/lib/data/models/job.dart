// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Job {
  Job({
    required this.city,
    required this.country,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.postedBy,
    required this.salary,
    required this.slug,
    required this.title,
    required this.updatedAt,
  });

  final String city;
  final String country;
  final DateTime createdAt;
  final String description;
  final int id;
  final int postedBy;
  final String salary;
  final String slug;
  final String title;
  final DateTime updatedAt;

  Job copyWith({
    String? city,
    String? country,
    DateTime? createdAt,
    String? description,
    int? id,
    int? postedBy,
    String? salary,
    String? slug,
    String? title,
    DateTime? updatedAt,
  }) {
    return Job(
      city: city ?? this.city,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      id: id ?? this.id,
      postedBy: postedBy ?? this.postedBy,
      salary: salary ?? this.salary,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'country': country,
      'created_at': createdAt.toIso8601String(),
      'description': description,
      'id': id,
      'posted_by': postedBy,
      'salary': salary,
      'slug': slug,
      'title': title,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      city: map['city'] as String,
      country: map['country'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      description: map['description'] as String,
      id: map['id'] as int,
      postedBy: map['posted_by'] as int,
      salary: map['salary'] as String,
      slug: map['slug'] as String,
      title: map['title'] as String,
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job(city: $city, country: $country, created_at: $createdAt, description: $description, id: $id, posted_by: $postedBy, salary: $salary, slug: $slug, title: $title, updated_at: $updatedAt)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.country == country &&
        other.createdAt == createdAt &&
        other.description == description &&
        other.id == id &&
        other.postedBy == postedBy &&
        other.salary == salary &&
        other.slug == slug &&
        other.title == title &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        country.hashCode ^
        createdAt.hashCode ^
        description.hashCode ^
        id.hashCode ^
        postedBy.hashCode ^
        salary.hashCode ^
        slug.hashCode ^
        title.hashCode ^
        updatedAt.hashCode;
  }
}

List<Job> jobsFromJson(String source) {
  final jsonResponse = json.decode(source);
  final List<dynamic> jobsList = jsonResponse['data'] as List<dynamic>;
  return jobsList
      .map((jobJson) => Job.fromMap(jobJson as Map<String, dynamic>))
      .toList();
}
