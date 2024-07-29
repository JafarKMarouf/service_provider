import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/expert.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/service.dart';

class DatumBooked extends Equatable {
  final int? id;
  final int? customerId;
  final int? expertId;
  final int? serviceId;
  final String? description;
  final String? deliveryTime;
  final String? deliveryDate;
  final String? status;
  final Expert? expert;
  final Service? service;
  final DateTime? createdAt;
  const DatumBooked({
    this.id,
    this.customerId,
    this.expertId,
    this.serviceId,
    this.description,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
    this.expert,
    this.service,
    this.createdAt,
  });

  factory DatumBooked.fromMap(Map<String, dynamic> data) => DatumBooked(
      id: data['id'] as int?,
      customerId: data['customer_id'] as int?,
      expertId: data['expert_id'] as int?,
      serviceId: data['service_id'] as int?,
      description: data['description'] as String?,
      deliveryTime: data['delivery_time'] as String?,
      deliveryDate: data['delivery_date'] as String?,
      status: data['status'] as String?,
      expert: data['expert'] == null
          ? null
          : Expert.fromMap(data['expert'] as Map<String, dynamic>),
      service: data['service'] == null
          ? null
          : Service.fromMap(data['service'] as Map<String, dynamic>),
      createdAt: DateTime.parse(data['created_at'] as String));

  Map<String, dynamic> toMap() => {
        'id': id,
        'customer_id': customerId,
        'expert_id': expertId,
        'service_id': serviceId,
        'description': description,
        'delivery_time': deliveryTime,
        'delivey_date': deliveryDate,
        'status': status,
        'expert': expert?.toMap(),
        'service': service?.toMap(),
        'created_at': createdAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DatumBooked].
  factory DatumBooked.fromJson(String data) {
    return DatumBooked.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DatumBooked] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      customerId,
      expertId,
      serviceId,
      description,
      deliveryTime,
      deliveryDate,
      status,
      expert,
      service,
      createdAt,
    ];
  }
}
