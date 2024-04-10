import 'package:equatable/equatable.dart';

import 'customer_info.dart';

class ProfileModel extends Equatable {
	final String? status;
	final List<CustomerInfo>? customerInfos;

	const ProfileModel({this.status, this.customerInfos});

	factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
				status: json['status'] as String?,
				customerInfos: (json['customer_infos'] as List<dynamic>?)
						?.map((e) => CustomerInfo.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'customer_infos': customerInfos?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [status, customerInfos];
}
