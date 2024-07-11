import 'package:equatable/equatable.dart';

sealed class PickBookServiceInfosState extends Equatable {
  const PickBookServiceInfosState();

  @override
  List<Object> get props => [];
}

final class PickBookServiceInfosInitial extends PickBookServiceInfosState {}

final class PickDateUpdated extends PickBookServiceInfosState {}

final class PickDateFailure extends PickBookServiceInfosState {}

final class PickTimeUpdated extends PickBookServiceInfosState {}

final class PickTimeFailure extends PickBookServiceInfosState {}

final class PickLocationLoading extends PickBookServiceInfosState {}

final class PickLocationUpdated extends PickBookServiceInfosState {}

final class PickLocationFailure extends PickBookServiceInfosState {}
