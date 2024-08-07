import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'service_user.dart';

class ServiceExpert extends Equatable {
  final int? id;
  final int? userId;
  final int? serviceId;
  final String? mobile;
  final String? country;
  final String? city;
  final int? rating;
  final double? price;
  final String? photo;
  final String? description;
  final String? workingHours;
  final ServiceUser? user;

  const ServiceExpert({
    this.id,
    this.userId,
    this.serviceId,
    this.mobile,
    this.country,
    this.city,
    this.rating,
    this.price,
    this.photo,
    this.description,
    this.workingHours,
    this.user,
  });

  factory ServiceExpert.fromMap(Map<String, dynamic> data) => ServiceExpert(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        serviceId: data['service_id'] as int?,
        mobile: data['mobile'] as String?,
        country: data['country'] as String?,
        city: data['city'] as String?,
        rating: data['rating'] as int?,
        price: (data['price'] as num?)?.toDouble(),
        photo: data['photo'] as String?,
        description: data['description'] as String?,
        workingHours: data['working_hours'] as String?,
        user: data['user'] == null
            ? null
            : ServiceUser.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'service_id': serviceId,
        'mobile': mobile,
        'country': country,
        'city': city,
        'rating': rating,
        'price': price,
        'photo': photo,
        'working_hours': workingHours,
        'user': user?.toMap(),
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceExpert].
  factory ServiceExpert.fromJson(String data) {
    return ServiceExpert.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceExpert] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      serviceId,
      mobile,
      country,
      city,
      rating,
      price,
      photo,
      workingHours,
      user,
      description,
    ];
  }
}
