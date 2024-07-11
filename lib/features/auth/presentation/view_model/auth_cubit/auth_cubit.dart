import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_storage.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freelancer_app/features/auth/presentation/view/email_verify_view.dart';
import 'package:get/get.dart' as g;

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
  bool loadingResend = false;

  bool isResendAgain = false;
  late Timer timer;
  int start = 120;

  //======================Logout variables=================================
  bool loadingLogout = false;

  final AuthRepoImpl authRepoImpl;

  AuthCubit(this.authRepoImpl) : super(AuthInitial());

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
      (user) async {
        emit(AuthSuccess(userModel: user));

        await AppStorage.storeToken(user.data!.token!);
        await AppStorage.storeUserId(user.data!.user!.id!.toString());
        await AppStorage.storeUserName(user.data!.user!.name.toString());
        await AppStorage.storeEmail(email);

        var isVerify = await AppStorage.getVerifiedEmail();

        Future.delayed(
          const Duration(microseconds: 250),
          () {
            isVerify != null
                ? g.Get.offAll(
                    () => const CustomeNavBar(),
                    transition: g.Transition.fadeIn,
                    duration: kDurationTransition,
                    arguments: user.data!.user!.name,
                  )
                : g.Get.to(
                    () => const EmailVerifyView(),
                    transition: g.Transition.fadeIn,
                    duration: kDurationTransition,
                  );
          },
        );
        if (isVerify == null) await resend();
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
      await AppStorage.storeToken(user.data!.token!);
      await AppStorage.storeUserId(user.data!.user!.id!.toString());
      await AppStorage.storeUserName(user.data!.user!.name!.toString());
      await AppStorage.storeEmail(email);
      emit(AuthSuccess(userModel: user));
    });
  }

  Future<void> verify({required String otp}) async {
    emit(AuthLoading());
    emailAddressVerify.text = await AppStorage.getEmail() ?? '';
    var result = await authRepoImpl.verify(
      email: emailAddressVerify.text,
      otp: otp,
    );

    result.fold((failure) {
      emit(AuthFailure(errorMessage: failure.errMessage));
    }, (user) async {
      if (start < 120) cancelTimer();
      await AppStorage.storeVerifedEmail(true);
      otpCodeVerify.clear();
      Future.delayed(
        const Duration(microseconds: 250),
        () {
          g.Get.to(
            () => const CustomeNavBar(),
            transition: g.Transition.fadeIn,
            duration: kDurationTransition,
          );
        },
      );
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
      (data) async {
        await startTimer();
        otpCodeVerify.clear();
        emit(AuthSuccess(userModel: data));
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    var result = await authRepoImpl.logout();

    return result.fold(
      (fail) => emit(AuthFailure(errorMessage: fail.errMessage)),
      (sucess) async {
        await AppStorage.removeToken();
        await AppStorage.removeEmail();
        await AppStorage.removeVerify();
        emit(AuthSuccess(userModel: sucess));
      },
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

  Future<void> startTimer() async {
    isResendAgain = true;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      emit(AuthStartTimer());

      if (start <= 120 && start > 0) {
        start--;
        emit(AuthUpdateTimer());
      } else if (start == 0) {
        isResendAgain = false;
        timer.cancel();
        emit(AuthCancelTimer());

        // cancelTimer();
        // timer.cancel();
        // emit(AuthCancelTimer());
      }
    });
  }

  Future<void> cancelTimer() async {
    isResendAgain = false;
    timer.cancel();
    emit(AuthCancelTimer());
  }

  Future<void> getEmail() async {
    emit(AuthLoading());
    email = await AppStorage.getEmail() ?? '';
    emit(AuthStoredEmailVerify());
  }
}
