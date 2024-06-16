import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'login',
        body: {
          'email': email,
          'password': password,
        },
      );
      UserModel user = UserModel.fromJson(data);

      await ApiService.storeToken(user.data!.token!);
      await ApiService.storeUserId(user.data!.user!.id!.toString());
      await ApiService.storeUserName(user.data!.user!.name.toString());

      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    // required String role,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'register',
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirm,
          'role': 'customer',
        },
      );
      UserModel user = UserModel.fromJson(data);
      await ApiService.storeToken(user.data!.token!);
      await ApiService.storeUserId(user.data!.user!.name!);

      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> resend() async {
    try {
      var data = await apiService.get(
        endPoint: 'email_verification/send',
      );
      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> verify({
    required String email,
    required String otp,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'email_verification/verify',
        body: {
          'email': email,
          'otp': otp,
        },
      );
      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> logout() async {
    try {
      ApiService.removeToken();
      var data = await apiService.post(endPoint: 'logout');
      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

//   Future<String?> getUser() async {
//     return await ApiService.getUserDetails();
//   }
}
