import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_services.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo.dart';

class BookServiceRepoImpl implements BookServiceRepo {
  ApiService apiService;
  BookServiceRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, BookServices>> fetchAllBookServices() async {
    try {
      var data = await apiService.get(endPoint: 'customer/book_service');
      return right(BookServices.fromMap(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DatumBooked>> addBookService({
    required int customerId,
    required int expertId,
    required int serviceId,
    required String deliveryTime,
    required String deliveryDate,
    String? description,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'customer/service/$serviceId/book_service',
        body: {
          'customer_id': customerId,
          'service_id': serviceId,
          'expert_id': expertId,
          'delivery_time': deliveryTime,
          'delivery_date': deliveryDate,
          'description': 'descriptiondescriptiondescription',
        },
      );
      // log('=======data:${data}');
      return right(DatumBooked.addBooked(data));
    } catch (e) {
      log('=====exception:$e');
      if (e is DioException) {
        log('=====dioException:${e.response!.data}');
        return left(ServerFailure.fromDioError(e));
      }
      // log('=====exception:${e.toString()}');

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookServices>> deleteBookService({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookServices>> showOneBookService({
    required int id,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookServices>> updateBookService({
    required int id,
  }) {
    throw UnimplementedError();
  }
}
