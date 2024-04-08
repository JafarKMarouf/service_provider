import 'package:equatable/equatable.dart';

import 'category.dart';
import 'expert.dart';

class Datum extends Equatable {
	final int? id;
	final int? expertId;
	final int? categoryId;
	final String? serviceName;
	final String? serviceDescription;
	final String? photo;
	final double? price;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Category? category;
	final Expert? expert;

	const Datum({
		this.id, 
		this.expertId, 
		this.categoryId, 
		this.serviceName, 
		this.serviceDescription, 
		this.photo, 
		this.price, 
		this.createdAt, 
		this.updatedAt, 
		this.category, 
		this.expert, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				expertId: json['expert_id'] as int?,
				categoryId: json['category_id'] as int?,
				serviceName: json['service_name'] as String?,
				serviceDescription: json['service_description'] as String?,
				photo: json['photo'] as String?,
				price: (json['price'] as num?)?.toDouble(),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				category: json['category'] == null
						? null
						: Category.fromJson(json['category'] as Map<String, dynamic>),
				expert: json['expert'] == null
						? null
						: Expert.fromJson(json['expert'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'expert_id': expertId,
				'category_id': categoryId,
				'service_name': serviceName,
				'service_description': serviceDescription,
				'photo': photo,
				'price': price,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'category': category?.toJson(),
				'expert': expert?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				expertId,
				categoryId,
				serviceName,
				serviceDescription,
				photo,
				price,
				createdAt,
				updatedAt,
				category,
				expert,
		];
	}
}
