import 'dart:convert';

import 'package:equatable/equatable.dart';

class Service extends Equatable {
	final int? id;
	final String? serviceName;
	final String? photo;

	const Service({this.id, this.serviceName, this.photo});

	factory Service.fromMap(Map<String, dynamic> data) => Service(
				id: data['id'] as int?,
				serviceName: data['service_name'] as String?,
				photo: data['photo'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'service_name': serviceName,
				'photo': photo,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Service].
	factory Service.fromJson(String data) {
		return Service.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Service] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, serviceName, photo];
}
