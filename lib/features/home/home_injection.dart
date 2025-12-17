import 'package:get_it/get_it.dart';
import 'package:telecom_support_app/features/home/data/datasources/home_repo_remote_data_source.dart';
import 'package:telecom_support_app/features/home/data/repositories/home_repo.dart';
import 'package:telecom_support_app/features/home/domain/repositories/home_repo.dart';
import 'package:telecom_support_app/features/home/domain/usecases/home_use_case.dart';
import 'package:telecom_support_app/features/home/presentation/cubit/home_cubit.dart';

Future<void> homeInit(GetIt sl) async {
  // Data Sources
  sl.registerLazySingleton<HomeRepoRemoteDataSource>(
    () => HomeRepoRemoteDataSourceImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<HomeRepoLocalDataSource>(
    () => HomeRepoLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remote: sl(), local: sl(), networkInfo: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => HomeUseCase(homeRepo: sl()));

  // Blocs
  sl.registerFactory(() => HomeCubit(homeUseCase: sl()));
}
