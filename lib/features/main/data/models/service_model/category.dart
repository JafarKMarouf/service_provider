import 'package:equatable/equatable.dart';

class Category extends Equatable {
	final int? id;
	final String? title;
	final String? description;

	const Category({this.id, this.title, this.description});

	factory Category.fromJson(Map<String, dynamic> json) => Category(
				id: json['id'] as int?,
				title: json['title'] as String?,
				description: json['description'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'description': description,
			};

	@override
	List<Object?> get props => [id, title, description];
}
