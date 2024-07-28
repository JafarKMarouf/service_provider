import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_model.dart';
import 'package:freelancer_app/features/main/data/repos/service_repo/service_repo_impl.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final ServiceRepoImpl serviceRepoImpl;

  ServiceCubit(this.serviceRepoImpl) : super(ServiceInitial());

  Future<void> fetchService({categoryId}) async {
    emit(ServiceLoading());
    var result = await serviceRepoImpl.fetchServices(categoryId: categoryId);

    result.fold(
      (fail) => emit(ServiceFailure(errMessage: fail.errMessage)),
      (service) => emit(ServiceSuccess(service: service)),
    );
  }

  Future<void> showService({serviceId}) async {
    emit(ServiceLoading());
    var result = await serviceRepoImpl.showService(id: serviceId);
    result.fold(
      (fail) => emit(ServiceFailure(errMessage: fail.errMessage)),
      (service) => emit(ServiceSuccess(service: service)),
    );
  }
}
