import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';
// import 'package:freelancer_app/features/auth/data/repos/auth_repo.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImpl) : super(AuthInitial());

  final AuthRepoImpl authRepoImpl;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await authRepoImpl.login(
      email: email,
      password: password,
    );
    print('===========result: $result============');
    result.fold((failure) {
      emit(AuthFailure(errorMessage: failure.errMessage));
    }, (user) {
      emit(AuthSuccess(userModel: user));
    });
    // result.fold((failure) {
    //   emit(AuthFailure(
    //     errorMessage: failure.errMessage,
    //   ));
    // }, (user) {
    //   emit(AuthSuccess(
    //     userModel: user,
    //   ));
    // });
  }
}
