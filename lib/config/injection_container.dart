import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:telecom_support_app/core/helper/api/api_consumer.dart';
import 'package:telecom_support_app/core/helper/api/app_interceptors.dart';
import 'package:telecom_support_app/core/helper/api/dio_consumer.dart';
import 'package:telecom_support_app/core/helper/database/my_data_base_local.dart';
import 'package:telecom_support_app/core/network/network_info.dart';
import 'package:telecom_support_app/features/auth/auth_injection.dart';
import 'package:telecom_support_app/features/home/home_injection.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features
  await authInit(sl);
  await homeInit(sl);

  // ! Core

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  // ! External

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  sl.registerLazySingleton(() => AppInterceptors());

  final database = await TicketsDb.instance.database;
  sl.registerLazySingleton<Database>(() => database);

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
  sl.registerLazySingleton(() => Dio());
}
