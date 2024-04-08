import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/home/data/models/service_model/service.dart';
import 'package:freelancer_app/features/home/data/repos/service_repo.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ApiService apiService;
  ServiceRepoImpl(this.apiService);

  @override
  Future<Service> fetchServices() async {
    // try {
    //  } catch (e) {
    //   print(e.toString());
    // }
    var data = await apiService.get(endPoint: 'customer/service/');

    Service service = Service.fromJson(data);
    // print('===============service $service ==============');

    return service;
  }

  @override
  Future<Service> showService({required int id}) {
    throw UnimplementedError();
  }
}
