import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service.dart';
import 'package:freelancer_app/features/main/data/repos/service_repo.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ApiService apiService;
  ServiceRepoImpl(this.apiService);

  @override
  Future<Either<Failure,Service>> fetchServices() async {
    try {
      var data = await apiService.get(
        endPoint: 'customer/service/',
      );
      return right(Service.fromJson(data));
    }
    catch (e) {
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
  Future<Either<Failure,Service>> showService({required int id}) {
    throw UnimplementedError();
  }
}
