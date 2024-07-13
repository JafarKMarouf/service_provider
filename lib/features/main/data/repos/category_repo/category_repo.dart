import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryDatum>> fetchCategories();

  Future<Either<Failure, CategoryDatum>> showCategory({required int id});
}
