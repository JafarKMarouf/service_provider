import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service.dart';

abstract class ServiceRepo {
  Future<Either<Failure, Service>> fetchServices();

  Future<Either<Failure, Service>> showService({required int id});
}
