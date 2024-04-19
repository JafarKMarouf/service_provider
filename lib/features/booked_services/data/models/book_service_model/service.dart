import 'package:equatable/equatable.dart';

import 'expert.dart';

class Service extends Equatable {
	final int? id;
	final String? serviceName;
	final int? expertId;
	final Expert? expert;

	const Service({this.id, this.serviceName, this.expertId, this.expert});

	factory Service.fromJson(Map<String, dynamic> json) => Service(
				id: json['id'] as int?,
				serviceName: json['service_name'] as String?,
				expertId: json['expert_id'] as int?,
				expert: json['expert'] == null
						? null
						: Expert.fromJson(json['expert'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'service_name': serviceName,
				'expert_id': expertId,
				'expert': expert?.toJson(),
			};

	@override
	List<Object?> get props => [id, serviceName, expertId, expert];
}
