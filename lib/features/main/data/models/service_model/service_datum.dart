import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'service_category.dart';
import 'service_expert.dart';

class ServiceDatum extends Equatable {
  final int? id;
  final int? categoryId;
  final String? serviceName;
  final String? serviceDescription;
  final String? photo;
  final ServiceCategory? category;
  final List<ServiceExpert>? expert;

  const ServiceDatum({
    this.id,
    this.categoryId,
    this.serviceName,
    this.serviceDescription,
    this.photo,
    this.category,
    this.expert,
  });

  factory ServiceDatum.fromMap(Map<String, dynamic> data) => ServiceDatum(
        id: data['id'] as int?,
        categoryId: data['category_id'] as int?,
        serviceName: data['service_name'] as String?,
        serviceDescription: data['service_description'] as String?,
        photo: data['photo'] as String?,
        category: data['category'] == null
            ? null
            : ServiceCategory.fromMap(data['category'] as Map<String, dynamic>),
        expert: (data['expert'] as List<dynamic>?)
            ?.map((e) => ServiceExpert.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'category_id': categoryId,
        'service_name': serviceName,
        'service_description': serviceDescription,
        'photo': photo,
        'category': category?.toMap(),
        'expert': expert?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceDatum].
  factory ServiceDatum.fromJson(String data) {
    return ServiceDatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceDatum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      categoryId,
      serviceName,
      serviceDescription,
      photo,
      category,
      expert,
    ];
  }
}
