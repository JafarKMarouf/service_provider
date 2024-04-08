import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/home/data/models/service_model/service.dart';
import 'package:freelancer_app/features/home/data/repos/service_repo_impl.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit(this.serviceRepoImpl) : super(ServiceInitial());

  final ServiceRepoImpl serviceRepoImpl;

  Future<void> fetchService() async {
    emit(ServiceLoading());
    var result = await serviceRepoImpl.fetchServices();
    try {
      emit(ServiceSuccess(service: result));
    } catch (e) {
      emit(ServiceFailure(errMessage: result.status!));
    }
  }
}
