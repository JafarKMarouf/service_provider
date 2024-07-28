import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_model.dart';

import 'service_repo.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ApiService apiService;
  ServiceRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ServiceModel>> fetchServices({categoryId}) async {
    try {
      var data = await apiService.get(
          endPoint: 'customer/service/category/$categoryId');
      return right(ServiceModel.fromMap(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServiceModel>> showService({required int id}) async {
    try {
      var data = await apiService.get(endPoint: 'customer/service/$id');
      return right(ServiceModel.fromMap(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
