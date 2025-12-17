import 'package:dartz/dartz.dart';
import 'package:telecom_support_app/core/error/failures.dart';
import 'package:telecom_support_app/features/auth/data/models/auth_model.dart';
import 'package:telecom_support_app/features/auth/domain/repositories/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Either<Failure, void>> call(AuthModel authModel) async {
    return await authRepo.login(authModel);
  }
}
