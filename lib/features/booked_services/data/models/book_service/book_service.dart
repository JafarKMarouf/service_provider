import 'package:equatable/equatable.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';

class BookService extends Equatable {
  final String? status;
  final List<DatumBooked>? data;

  const BookService({this.status, this.data});

  factory BookService.fromJson(Map<String, dynamic> json) => BookService(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DatumBooked.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, data];
}
