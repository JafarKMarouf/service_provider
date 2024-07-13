import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final int? id;
	final String? title;
	final String? description;
	final String? photo;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Datum({
		this.id, 
		this.title, 
		this.description, 
		this.photo, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMap(Map<String, dynamic> data) => Datum(
				id: data['id'] as int?,
				title: data['title'] as String?,
				description: data['description'] as String?,
				photo: data['photo'] as String?,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'title': title,
				'description': description,
				'photo': photo,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				id,
				title,
				description,
				photo,
				createdAt,
				updatedAt,
		];
	}
}
