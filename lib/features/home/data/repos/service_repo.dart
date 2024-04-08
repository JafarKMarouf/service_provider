import 'package:freelancer_app/features/home/data/models/service_model/service.dart';

abstract class ServiceRepo {
  Future<Service> fetchServices();

  Future<Service> showService({
    required int id,
  });
}
