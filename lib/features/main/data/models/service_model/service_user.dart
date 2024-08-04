import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceUser extends Equatable {
  final int? id;
  final String? name;
  final String? role;

  const ServiceUser({this.id, this.name, this.role});

  factory ServiceUser.fromMap(Map<String, dynamic> data) => ServiceUser(
        id: data['id'] as int?,
        name: data['name'] as String?,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceUser].
  factory ServiceUser.fromJson(String data) {
    return ServiceUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceUser] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, name, role];
}
