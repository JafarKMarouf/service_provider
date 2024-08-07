import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? role;

	const User({this.id, this.name, this.email, this.role});

	factory User.fromMap(Map<String, dynamic> data) => User(
				id: data['id'] as int?,
				name: data['name'] as String?,
				email: data['email'] as String?,
				role: data['role'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'name': name,
				'email': email,
				'role': role,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, name, email, role];
}
