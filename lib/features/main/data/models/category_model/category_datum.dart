import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryDatum extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? photo;

  const CategoryDatum({
    this.id,
    this.title,
    this.description,
    this.photo,
  });

  factory CategoryDatum.fromMap(Map<String, dynamic> data) => CategoryDatum(
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
  /// Parses the string and returns the resulting Json object as [CategoryDatum].
  factory CategoryDatum.fromJson(String data) {
    return CategoryDatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryDatum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      photo,
    ];
  }
}
