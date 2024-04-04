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
      return right(UserModel.fromJson(data));

    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirm,
      required String role}) {
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, UserModel>> register(
  //     {required String name,
  //     required String email,
  //     required String password,
  //     required String passwordConfirm,
  //     required String role}) async {
  //   try {
  //     var data = await apiService.post(
  //       endPoint: 'register',
  //       body: {
  //         'name': name,
  //         'email': email,
  //         'password': password,
  //         'password_confirmation': passwordConfirm,
  //         'role': role,
  //       },
  //     );
  //     return right(data);
  //   } catch (e) {
  //     return left(ServerFailure());
  //   }
  // }
}
