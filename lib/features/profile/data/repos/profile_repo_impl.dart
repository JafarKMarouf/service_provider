import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:freelancer_app/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;
  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ProfileModel>> showProfile() async {
    try {
      var id = await apiService.getUserId();
      var user = await apiService.get(
        endPoint: 'customer/profile/',
        id: id,
      );
      // print('===============user: $user ===================');
      return right(ProfileModel.fromJson(user));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
    // throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileModel>> updateProfile({
    required String userId,
    String? email,
    String? password,
    String? photo,
  }) async {
    try {
      var user = await apiService.post(
        endPoint: 'customer/profile/$userId',
        body: {
          'email': email ?? '',
          // 'photo': photo ?? '',
          // 'password': password ?? '',
        },
      );
      return right(ProfileModel.fromJson(user));
    } catch (e) {
      log('==========exception :${e.toString()}========');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      log('==========faile :${e.toString()}========');

      return left(ServerFailure(e.toString()));
    }
  }
}
