import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'customer_infos.dart';

class ProfileModel extends Equatable {
  final String? status;
  final List<CustomerInfos>? customerInfos;

  const ProfileModel({this.status, this.customerInfos});

  factory ProfileModel.fromMap(Map<String, dynamic> data) => ProfileModel(
        status: data['status'] as String?,
        customerInfos: (data['data'] as List<dynamic>?)
            ?.map((e) => CustomerInfos.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': customerInfos?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileModel].
  factory ProfileModel.fromJson(String data) {
    return ProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, customerInfos];
}
