import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/features/auth/data/models/auth_model.dart';
import 'package:telecom_support_app/features/auth/domain/usecases/login_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase? loginUseCase;

  AuthCubit({required this.loginUseCase}) : super(AuthInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final keyLogin = GlobalKey<FormState>();

  bool obscure = true;

  void togglePasswordVisibility() {
    obscure = !obscure;
    emit(AuthChangePasswordVisibility(obscure));
  }

  Future<void> loginRequest(AuthModel authModel) async {
    emit(LoginLoadingState());
    final res = await loginUseCase!.call(authModel);

    res.fold(
      (failure) {
        emit(LoginErrorState(error: failure.error));
      },
      (response) async {
        emit(LoginSuccessState());
      },
    );
  }
}
