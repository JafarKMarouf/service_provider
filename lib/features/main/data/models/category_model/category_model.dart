import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'category_datum.dart';

class CategoryModel extends Equatable {
  final String? status;
  final int? count;
  final List<CategoryDatum>? data;

  const CategoryModel({this.status, this.count, this.data});

  factory CategoryModel.fromMap(Map<String, dynamic> data) => CategoryModel(
        status: data['status'] as String?,
        count: data['count'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => CategoryDatum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'count': count,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryModel].
  factory CategoryModel.fromJson(String data) {
    return CategoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, count, data];
}
