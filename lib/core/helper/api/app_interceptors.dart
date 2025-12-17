import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    // options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    options.headers[AppStrings.acceptLanguage] = 'en'; // appLang;
    if (token.isNotEmpty) {
      options.headers[AppStrings.authorization] = '${AppStrings.bearer} $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.toString());
    // debugPrint(
    // 'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // debugPrint(
    // 'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
