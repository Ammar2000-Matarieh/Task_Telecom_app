part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;

  const LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class LoginSuccessState extends AuthState {
  const LoginSuccessState();

  @override
  List<Object> get props => [];
}

class AuthChangePasswordVisibility extends AuthState {
  final bool isHidden;
  const AuthChangePasswordVisibility(this.isHidden);

  @override
  List<Object> get props => [isHidden];
}
