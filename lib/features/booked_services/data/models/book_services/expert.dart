import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class Expert extends Equatable {
  final int? id;
  final int? userId;
  final String? mobile;
  final String? city;
  final String? country;
  final int? rating;
  final double? price;
  final String? photo;
  final String? description;
  final String? workHours;
  final User? user;

  const Expert({
    this.id,
    this.userId,
    this.mobile,
    this.city,
    this.country,
    this.rating,
    this.price,
    this.photo,
    this.user,
    this.description,
    this.workHours,
  });

  factory Expert.fromMap(Map<String, dynamic> data) => Expert(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        mobile: data['mobile'] as String?,
        city: data['city'] as String?,
        country: data['country'] as String?,
        rating: data['rating'] as int?,
        price: (data['price'] as num?)?.toDouble(),
        photo: data['photo'] as String?,
        description: data['descrtiption'] as String?,
        workHours: data['working_hours'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'mobile': mobile,
        'city': city,
        'country': country,
        'rating': rating,
        'price': price,
        'photo': photo,
        'user': user?.toMap(),
        'description': description,
        'working_hours': workHours,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Expert].
  factory Expert.fromJson(String data) {
    return Expert.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Expert] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      mobile,
      city,
      country,
      rating,
      price,
      photo,
      user,
      description,
      workHours,
    ];
  }
}
