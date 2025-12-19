import 'package:get_it/get_it.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/google_map_cubit.dart';

Future<void> googleMapInit(GetIt sl) async {
  sl.registerFactory<GoogleMapCubit>(() => GoogleMapCubit());
  // Data Sources
  // sl.registerLazySingleton<HomeRepoRemoteDataSource>(
  //   () => HomeRepoRemoteDataSourceImpl(apiConsumer: sl()),
  // );

  // sl.registerLazySingleton<HomeRepoLocalDataSource>(
  //   () => HomeRepoLocalDataSourceImpl(sl()),
  // );

  // // Repository
  // sl.registerLazySingleton<HomeRepo>(
  //   () => HomeRepoImpl(remote: sl(), local: sl(), networkInfo: sl()),
  // );

  // // Use Cases
  // sl.registerLazySingleton(() => HomeUseCase(homeRepo: sl()));

  // // Blocs
  // sl.registerFactory(() => HomeCubit(homeUseCase: sl()));
}
