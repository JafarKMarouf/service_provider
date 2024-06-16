import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/book_service.dart';

abstract class BookServiceRepo {
  Future<Either<Failure, BookService>> fetchAllBookServices();

  Future<Either<Failure, BookService>> showOneBookService({required int id});

  Future<Either<Failure, BookService>> updateBookService({required int id});

  Future<Either<Failure, BookService>> deleteBookService({required int id});
}
