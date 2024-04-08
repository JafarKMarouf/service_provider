import 'package:equatable/equatable.dart';

class ExpertInfos extends Equatable {
	final int? expertId;
	final String? mobile;
	final String? country;
	final String? city;
	final String? certificate;

	const ExpertInfos({
		this.expertId, 
		this.mobile, 
		this.country, 
		this.city, 
		this.certificate, 
	});

	factory ExpertInfos.fromJson(Map<String, dynamic> json) => ExpertInfos(
				expertId: json['expert_id'] as int?,
				mobile: json['mobile'] as String?,
				country: json['country'] as String?,
				city: json['city'] as String?,
				certificate: json['certificate'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'expert_id': expertId,
				'mobile': mobile,
				'country': country,
				'city': city,
				'certificate': certificate,
			};

	@override
	List<Object?> get props {
		return [
				expertId,
				mobile,
				country,
				city,
				certificate,
		];
	}
}
