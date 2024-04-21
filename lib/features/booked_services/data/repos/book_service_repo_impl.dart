// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service_model/book_service_model.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo.dart';

class BookServiceRepoImpl implements BookServiceRepo {
  ApiService apiService;
  BookServiceRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, BookServiceModel>> fetchAllBookServices() async {
    try {
      var data = await apiService.get(
        endPoint: 'customer/book_service',
      );
      print('================data: $data =============');
      return right(BookServiceModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BookServiceModel>> deleteBookService({
    required int id,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookServiceModel>> showOneBookService({
    required int id,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookServiceModel>> updateBookService({
    required int id,
  }) {
    throw UnimplementedError();
  }
}
