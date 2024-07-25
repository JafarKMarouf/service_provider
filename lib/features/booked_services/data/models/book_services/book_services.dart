import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class BookServices extends Equatable {
	final String? status;
	final int? count;
	final List<DatumBooked>? data;

	const BookServices({this.status, this.count, this.data});

	factory BookServices.fromMap(Map<String, dynamic> data) => BookServices(
				status: data['status'] as String?,
				count: data['count '] as int?,
				data: (data['data'] as List<dynamic>?)
						?.map((e) => DatumBooked.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'status': status,
				'count ': count,
				'data': data?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BookServices].
	factory BookServices.fromJson(String data) {
		return BookServices.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [BookServices] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [status, count, data];
}
