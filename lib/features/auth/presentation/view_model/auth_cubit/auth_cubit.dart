import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_storage.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String? name;
  //==================== login variables ==================
  GlobalKey<FormState> formKeyLogin = GlobalKey();
  AutovalidateMode autoValidateLogin = AutovalidateMode.disabled;

  TextEditingController emailAddressLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  bool passwordVisibleLogin = false;
  bool loadingLogin = false;
  //======================Signup variables=================================
  TextEditingController usernameRegister = TextEditingController();
  TextEditingController emailAddressRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  TextEditingController passwordConfirmRegister = TextEditingController();
  bool passwordVisibleRegister = false;
  AutovalidateMode autoValidateRegister = AutovalidateMode.disabled;
  GlobalKey<FormState> formKeyRegister = GlobalKey();
  bool loadingRegister = false;

  //======================Verify variables=================================
  final TextEditingController emailAddressVerify = TextEditingController();
  final TextEditingController otpCodeVerify = TextEditingController();
  GlobalKey<FormState> formKeyVerify = GlobalKey();
  AutovalidateMode autoValidateVerify = AutovalidateMode.disabled;
  String email = '';
  bool loadingVerify = false;
  bool isResendAgain = false;
  late Timer timer;
  int start = 120;
  //======================Logout variables=================================

  AuthCubit(this.authRepoImpl) : super(AuthInitial());

  final AuthRepoImpl authRepoImpl;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await authRepoImpl.login(email: email, password: password);
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.errMessage));
      },
      (user) {
        emit(AuthSuccess(userModel: user));
      },
    );
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    emit(AuthLoading());
    var result = await authRepoImpl.register(
      name: username,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
    );
    result.fold((failure) {
      emit(AuthFailure(errorMessage: failure.errMessage));
    }, (user) async {
      await AppStorage.storeEmail(email);
      // var x = await getEmail();
      // log('=========x:$x');
      emit(AuthSuccess(userModel: user));
    });
  }

  Future<void> verify({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());
    var result = await authRepoImpl.verify(
      email: email,
      otp: otp,
    );
    return result.fold((failure) {
      emit(AuthFailure(errorMessage: failure.errMessage));
    }, (user) {
      emit(AuthSuccess(userModel: user));
    });
  }

  Future<void> resend() async {
    emit(AuthLoading());

    var result = await authRepoImpl.resend();
    return result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.errMessage));
      },
      (data) {
        startTimer();

        emit(AuthSuccess(userModel: data));
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    var result = await authRepoImpl.logout();

    return result.fold(
      (fail) => emit(AuthFailure(errorMessage: fail.errMessage)),
      (sucess) => emit(AuthSuccess(userModel: sucess)),
    );
  }

  void visibleLogin() {
    emit(AuthInVisible());
    passwordVisibleLogin = !passwordVisibleLogin;
    emit(AuthVisible());
  }

  void visibleRegister() {
    emit(AuthInVisible());
    passwordVisibleRegister = !passwordVisibleRegister;
    emit(AuthVisible());
  }

  void startTimer() {
    isResendAgain = true;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      emit(AuthStartTimer());

      if (start == 0) {
        emit(AuthCancelTimer());
        isResendAgain = false;
        timer.cancel();
      } else {
        emit(AuthUpdateTimer());
        start--;
      }
      // emit(AuthUpdateTimer());
    });
  }

  Future<void> getEmail() async {
    email = await AppStorage.getEmail() ?? '';
    // return email;
  }
}
