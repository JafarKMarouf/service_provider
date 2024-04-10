import 'package:equatable/equatable.dart';

import 'customer.dart';

class CustomerInfo extends Equatable {
	final int? customerId;
	final String? mobile;
	final String? city;
	final String? country;
	final String? photo;
	final Customer? customer;

	const CustomerInfo({
		this.customerId, 
		this.mobile, 
		this.city, 
		this.country, 
		this.photo, 
		this.customer, 
	});

	factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
				customerId: json['customer_id'] as int?,
				mobile: json['mobile'] as String?,
				city: json['city'] as String?,
				country: json['country'] as String?,
				photo: json['photo'] as String?,
				customer: json['customer'] == null
						? null
						: Customer.fromJson(json['customer'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'customer_id': customerId,
				'mobile': mobile,
				'city': city,
				'country': country,
				'photo': photo,
				'customer': customer?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				customerId,
				mobile,
				city,
				country,
				photo,
				customer,
		];
	}
}
