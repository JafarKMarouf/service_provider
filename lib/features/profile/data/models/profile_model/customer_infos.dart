import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class CustomerInfos extends Equatable {
  final int? userId;
  final String? mobile;
  final String? city;
  final String? country;
  final String? photo;
  final DateTime? updatedAt;
  final User? user;

  const CustomerInfos({
    this.userId,
    this.mobile,
    this.city,
    this.country,
    this.photo,
    this.updatedAt,
    this.user,
  });

  factory CustomerInfos.fromMap(Map<String, dynamic> data) => CustomerInfos(
        userId: data['user_id'] as int?,
        mobile: data['mobile'] as String?,
        city: data['city'] as String?,
        country: data['country'] as String?,
        photo: data['photo'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'mobile': mobile,
        'city': city,
        'country': country,
        'photo': photo,
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomerInfos].
  factory CustomerInfos.fromJson(String data) {
    return CustomerInfos.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CustomerInfos] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      userId,
      mobile,
      city,
      country,
      photo,
      updatedAt,
      user,
    ];
  }
}
