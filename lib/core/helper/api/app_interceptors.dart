import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppStrings.acceptLanguage] = 'en';
    if (token.isNotEmpty) {
      options.headers[AppStrings.authorization] = '${AppStrings.bearer} $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.toString());

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // debugPrint(
    // 'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
