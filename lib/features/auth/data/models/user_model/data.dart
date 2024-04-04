import 'package:equatable/equatable.dart';

import 'user.dart';

class Data extends Equatable {
	final String? token;
	final User? user;

	const Data({this.token, this.user});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				token: json['token'] as String?,
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'token': token,
				'user': user?.toJson(),
			};

	@override
	List<Object?> get props => [token, user];
}
