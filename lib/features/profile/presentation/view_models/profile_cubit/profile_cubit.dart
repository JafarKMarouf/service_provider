import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:freelancer_app/features/profile/data/repos/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepoImpl) : super(ProfileInitial());
  // String name;
  final ProfileRepoImpl profileRepoImpl;

  Future<void> showProfile() async {
    emit(ProfileLoading());

    var result = await profileRepoImpl.showProfile();
    result.fold((fail) {
      emit(ProfileFailure(errMessage: fail.errMessage));
    }, (user) {
      emit(ProfileSuccess(profileModel: user));
    });
  }

  Future<void> updateProfile({
    required int userId,
    String? email,
    String? password,
    String? photo,
  }) async {
    log('========userId : $userId=========');
    log('========email : $email=========');

    emit(ProfileLoading());
    var result = await profileRepoImpl.updateProfile(
      userId: userId.toString(),
      photo: photo,
      email: email,
      password: password,
    );
    result.fold((fail) {
      emit(ProfileFailure(errMessage: fail.errMessage));
    }, (user) {
      emit(ProfileSuccess(profileModel: user));
    });
  }
}
