import 'package:equatable/equatable.dart';

import 'expert_infos.dart';

class Expert extends Equatable {
	final int? id;
	final String? name;
	final ExpertInfos? expertInfos;

	const Expert({this.id, this.name, this.expertInfos});

	factory Expert.fromJson(Map<String, dynamic> json) => Expert(
				id: json['id'] as int?,
				name: json['name'] as String?,
				expertInfos: json['expert_infos'] == null
						? null
						: ExpertInfos.fromJson(json['expert_infos'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'expert_infos': expertInfos?.toJson(),
			};

	@override
	List<Object?> get props => [id, name, expertInfos];
}
