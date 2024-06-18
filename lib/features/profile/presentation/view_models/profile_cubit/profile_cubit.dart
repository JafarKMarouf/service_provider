import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:freelancer_app/features/profile/data/repos/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepoImpl) : super(ProfileInitial());
  // String name;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autovalidateMod = AutovalidateMode.disabled;
  TextEditingController? emailAddress = TextEditingController();
  TextEditingController? password = TextEditingController();
  // bool editEmail = true;
  // bool editPassword = true;
  // bool passwordVisible = false;

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
    Map<String, dynamic>? body,
  }) async {
    emit(ProfileLoading());
    var result = await profileRepoImpl.updateProfile(
      userId: userId.toString(),
      body: body,
    );
    // log('==========result: $result===========');
    result.fold((fail) {
      emit(ProfileFailure(errMessage: fail.errMessage));
    }, (user) {
      emit(ProfileSuccess(profileModel: user));
    });
  }

  // void updateEmail() {
  //   editEmail = !editEmail;
  //   emit(ProfileEditEmail());
  //   // emit(const ProfileSuccess());
  // }

  // void updatePassword() {
  //   editPassword = !editPassword;
  //   emit(const ProfileSuccess());
  // }

  // void showPassword() {
  //   passwordVisible = !passwordVisible;
  //   emit(const ProfileSuccess());
  // }
}
