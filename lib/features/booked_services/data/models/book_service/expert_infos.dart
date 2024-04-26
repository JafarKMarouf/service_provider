import 'package:equatable/equatable.dart';

class ExpertInfos extends Equatable {
	final int? id;
	final int? expertId;
	final String? mobile;
	final String? country;
	final String? city;
	final dynamic rating;
	final String? description;
	final String? certificate;
	final String? workingHours;
	final String? photo;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const ExpertInfos({
		this.id, 
		this.expertId, 
		this.mobile, 
		this.country, 
		this.city, 
		this.rating, 
		this.description, 
		this.certificate, 
		this.workingHours, 
		this.photo, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory ExpertInfos.fromJson(Map<String, dynamic> json) => ExpertInfos(
				id: json['id'] as int?,
				expertId: json['expert_id'] as int?,
				mobile: json['mobile'] as String?,
				country: json['country'] as String?,
				city: json['city'] as String?,
				rating: json['rating'] as dynamic,
				description: json['description'] as String?,
				certificate: json['certificate'] as String?,
				workingHours: json['working_hours'] as String?,
				photo: json['photo'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'expert_id': expertId,
				'mobile': mobile,
				'country': country,
				'city': city,
				'rating': rating,
				'description': description,
				'certificate': certificate,
				'working_hours': workingHours,
				'photo': photo,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				expertId,
				mobile,
				country,
				city,
				rating,
				description,
				certificate,
				workingHours,
				photo,
				createdAt,
				updatedAt,
		];
	}
}
