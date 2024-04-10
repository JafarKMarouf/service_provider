import 'package:equatable/equatable.dart';

class Customer extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? role;

	const Customer({this.id, this.name, this.email, this.role});

	factory Customer.fromJson(Map<String, dynamic> json) => Customer(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				role: json['role'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'role': role,
			};

	@override
	List<Object?> get props => [id, name, email, role];
}
