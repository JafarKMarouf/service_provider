import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_model.dart';

abstract class ServiceRepo {
  Future<Either<Failure, ServiceModel>> fetchServices();

  Future<Either<Failure, ServiceModel>> showService({required int id});
}
