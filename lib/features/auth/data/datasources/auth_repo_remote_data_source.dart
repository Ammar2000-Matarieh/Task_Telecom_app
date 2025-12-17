import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telecom_support_app/core/error/exceptions.dart';
import 'package:telecom_support_app/features/auth/data/models/auth_model.dart';

abstract class AuthRepoRemoteDataSource {
  Future<void> login(AuthModel authModel);
}

class AuthRepoRemoteDataSourceImpl implements AuthRepoRemoteDataSource {
  final auth = FirebaseAuth.instance;
  @override
  Future<void> login(AuthModel authModel) async {
    try {
      var res = await auth.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );

      print(res.user?.email);
    } catch (e) {
      log("Error during Login : $e");
      throw ServerException();
    }
  }
}
