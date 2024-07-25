import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_services.dart';

abstract class BookServiceRepo {
  Future<Either<Failure, BookServices>> fetchAllBookServices();

  Future<Either<Failure, BookServices>> showOneBookService({required int id});

  Future<Either<Failure, BookServices>> updateBookService({required int id});

  Future<Either<Failure, BookServices>> deleteBookService({required int id});
}
