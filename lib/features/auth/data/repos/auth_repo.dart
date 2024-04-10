import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    // required String role,
  });

  Future<Either<Failure, UserModel>> verify({
    required String email,
    required String otp,
  });

  Future<Either<Failure, UserModel>> resend();

  Future<Either<Failure,UserModel>> logout();
}
