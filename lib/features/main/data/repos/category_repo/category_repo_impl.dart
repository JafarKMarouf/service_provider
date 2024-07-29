
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category.dart';
import 'package:freelancer_app/features/main/data/repos/category_repo/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  final ApiService apiService;
  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CategoryDatum>> fetchCategories() async {
    try {
      var data = await apiService.get(endPoint: 'customer/category/');
      // log('====data:$data');

      return right(CategoryDatum.fromMap(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryDatum>> showCategory({required int id}) {
    throw UnimplementedError();
  }
}
