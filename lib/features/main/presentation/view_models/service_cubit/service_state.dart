part of 'service_cubit.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceFailure extends ServiceState {
  final String errMessage;
  const ServiceFailure({required this.errMessage});
}

final class ServiceSuccess extends ServiceState {
  final ServiceModel service;
  const ServiceSuccess({required this.service});
}
