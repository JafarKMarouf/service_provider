import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String? name;

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
    }, (user) {
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
}
