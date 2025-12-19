import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:telecom_support_app/features/close/data/datasources/close_job_local_ds.dart';
import 'package:telecom_support_app/features/close/data/datasources/close_job_remote_ds.dart';
import 'package:telecom_support_app/features/close/data/repositories/close_job_repo_impl.dart';
import 'package:telecom_support_app/features/close/domain/repositories/close_job_repo.dart';
import 'package:telecom_support_app/features/close/domain/usecases/close_job_usecase.dart';
import 'package:telecom_support_app/features/close/presentation/cubit/close_cubit.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/sync/sync_cubit.dart';

Future<void> closeJobInit(GetIt sl) async {
  // 🔹 Data Sources
  sl.registerLazySingleton<CloseJobRemoteDS>(
    () => CloseJobRemoteDSImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<CloseJobLocalDS>(() => CloseJobLocalDSImpl(sl()));

  // 🔹 Repository
  sl.registerLazySingleton<CloseJobRepo>(
    () => CloseJobRepoImpl(local: sl(), networkInfo: sl(), remote: sl()),
  );

  // 🔹 Use Case
  sl.registerLazySingleton(() => CloseJobUseCase(sl()));

  // 🔹 Cubits
  sl.registerFactory(() => CloseCubit(sl(), sl()));

  // 🔥 SyncCubit
  sl.registerFactory<SyncCubit>(
    () => SyncCubit(sl<CloseJobRepo>(), sl<Connectivity>()),
  );
}
