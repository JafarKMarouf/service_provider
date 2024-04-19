import 'package:equatable/equatable.dart';

import 'service.dart';

class Datum extends Equatable {
	final int? id;
	final int? customerId;
	final int? serviceId;
	final String? description;
	final String? deliveryTime;
	final String? status;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Service? service;

	const Datum({
		this.id, 
		this.customerId, 
		this.serviceId, 
		this.description, 
		this.deliveryTime, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
		this.service, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				customerId: json['customer_id'] as int?,
				serviceId: json['service_id'] as int?,
				description: json['description'] as String?,
				deliveryTime: json['delivery_time'] as String?,
				status: json['status'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				service: json['service'] == null
						? null
						: Service.fromJson(json['service'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'customer_id': customerId,
				'service_id': serviceId,
				'description': description,
				'delivery_time': deliveryTime,
				'status': status,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'service': service?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				customerId,
				serviceId,
				description,
				deliveryTime,
				status,
				createdAt,
				updatedAt,
				service,
		];
	}
}
