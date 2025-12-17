import 'package:get_it/get_it.dart';
import 'package:telecom_support_app/features/auth/data/datasources/auth_repo_remote_data_source.dart';
import 'package:telecom_support_app/features/auth/data/repositories/auth_repo.dart';
import 'package:telecom_support_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:telecom_support_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:telecom_support_app/features/auth/presentation/cubit/auth_cubit.dart';

Future<void> authInit(GetIt sl) async {
  // Data Sources
  sl.registerLazySingleton<AuthRepoRemoteDataSource>(
    () => AuthRepoRemoteDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRepoRemoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(authRepo: sl()));

  // Blocs
  sl.registerFactory(() => AuthCubit(loginUseCase: sl()));
}
