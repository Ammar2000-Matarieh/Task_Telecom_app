import 'package:dartz/dartz.dart';
import 'package:telecom_support_app/core/error/failures.dart';
import 'package:telecom_support_app/features/auth/data/datasources/auth_repo_remote_data_source.dart';
import 'package:telecom_support_app/features/auth/data/models/auth_model.dart';
import 'package:telecom_support_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRepoRemoteDataSource authRepoRemoteDataSource;

  AuthRepoImpl({required this.authRepoRemoteDataSource});

  @override
  Future<Either<Failure, void>> login(AuthModel authModel) async {
    try {
      final res = await authRepoRemoteDataSource.login(authModel);
      return Right(res);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
