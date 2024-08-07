part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String errMessage;
  const ProfileFailure({required this.errMessage});
}

final class ProfileSuccess extends ProfileState {
  final ProfileModel? profileModel;
  const ProfileSuccess({this.profileModel});
}

final class ProfileEditEmail extends ProfileState {}

final class ProfileEditPassword extends ProfileState {}
