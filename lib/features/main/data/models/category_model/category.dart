import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class CategoryDatum extends Equatable {
  final String? status;
  final int? count;
  final List<Datum>? data;

  const CategoryDatum({this.status, this.count, this.data});

  factory CategoryDatum.fromMap(Map<String, dynamic> data) => CategoryDatum(
        status: data['status'] as String?,
        count: data['count'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'count': count,
        'data': data?.map((e) => e.toMap()).toList(),
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
  List<Object?> get props => [status, count, data];
}
