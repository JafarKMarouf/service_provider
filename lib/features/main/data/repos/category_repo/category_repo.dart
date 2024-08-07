import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryModel>> fetchCategories();

  Future<Either<Failure, CategoryModel>> showCategory({required int id});
}
