import 'package:dartz/dartz.dart';
import 'package:telecom_support_app/core/error/failures.dart';
import 'package:telecom_support_app/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login(AuthModel authModel);
}
