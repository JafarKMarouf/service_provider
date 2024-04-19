import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service_model/book_service_model.dart';

abstract class BookServiceRepo {
  Future<Either<Failure, BookServiceModel>> fetchAllBookServices();
  
  Future<Either<Failure, BookServiceModel>> showOneBookService({
    required int id,
  });

  Future<Either<Failure, BookServiceModel>> updateBookService({
    required int id,
  });

  Future<Either<Failure, BookServiceModel>> deleteBookService({
    required int id,
  });
}
