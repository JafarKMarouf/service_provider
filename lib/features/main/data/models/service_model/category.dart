import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
	final int? id;
	final String? title;
	final String? description;
	final String? photo;

	const Category({this.id, this.title, this.description, this.photo});

	factory Category.fromMap(Map<String, dynamic> data) => Category(
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
  /// Parses the string and returns the resulting Json object as [Category].
	factory Category.fromJson(String data) {
		return Category.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, title, description, photo];
}
