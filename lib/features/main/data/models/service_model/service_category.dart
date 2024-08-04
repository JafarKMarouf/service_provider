import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceCategory extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? photo;

  const ServiceCategory({this.id, this.title, this.description, this.photo});

  factory ServiceCategory.fromMap(Map<String, dynamic> data) => ServiceCategory(
        id: data['id'] as int?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        photo: data['photo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'photo': photo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceCategory].
  factory ServiceCategory.fromJson(String data) {
    return ServiceCategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceCategory] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, title, description, photo];
}
