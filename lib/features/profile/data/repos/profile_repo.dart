import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> showProfile();
  Future<Either<Failure, ProfileModel>> updateProfile({required int userId});
  // Future<Either<Failure, ProfileModel>> deleteProfile({required int id});
 
}
