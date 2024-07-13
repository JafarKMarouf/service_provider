import 'package:equatable/equatable.dart';

import 'expert.dart';

class Service extends Equatable {
  final int? id;
  final String? serviceName;
  final String? photo;
  final num? price;
  final int? expertId;
  final Expert? expert;

  const Service({
    this.id,
    this.serviceName,
    this.expertId,
    this.expert,
    this.photo,
    this.price,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int?,
        serviceName: json['service_name'] as String?,
        photo: json['photo'] as String?,
        price: json['price'] as num?,
        expertId: json['expert_id'] as int?,
        expert: json['expert'] == null
            ? null
            : Expert.fromJson(json['expert'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'service_name': serviceName,
        'photo': photo,
        'price': price,
        'expert_id': expertId,
        'expert': expert?.toJson(),
      };

  @override
  List<Object?> get props => [id, serviceName, photo, price, expertId, expert];
}
