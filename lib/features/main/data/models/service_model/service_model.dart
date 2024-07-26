import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'service_datum.dart';

class ServiceModel extends Equatable {
  final String? status;
  final int? count;
  final List<ServiceDatum>? data;

  const ServiceModel({this.status, this.count, this.data});

  factory ServiceModel.fromMap(Map<String, dynamic> data) => ServiceModel(
        status: data['status'] as String?,
        count: data['count'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => ServiceDatum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'count': count,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceModel].
  factory ServiceModel.fromJson(String data) {
    return ServiceModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, count, data];
}
