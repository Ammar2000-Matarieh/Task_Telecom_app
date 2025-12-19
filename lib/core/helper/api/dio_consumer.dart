import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:telecom_support_app/config/injection_container.dart';
import 'package:telecom_support_app/core/error/exceptions.dart';
import 'package:telecom_support_app/core/helper/api/api_consumer.dart';
import 'package:telecom_support_app/core/helper/api/app_interceptors.dart';
import 'package:telecom_support_app/core/helper/api/end_points.dart';
import 'package:telecom_support_app/core/helper/api/status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };

    client.options
      ..baseUrl = APIEndPoints.baseURL
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;

    client.interceptors.add(sl<AppInterceptors>());

    if (kDebugMode) {
      // client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await client.get(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {'Content-Type': 'application/json', ...?headers},
        ),
      );
      log("GET response: ${response.data}");
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.post(
        path,
        data: jsonEncode(body),
        queryParameters: queryParameters,
        options: Options(
          headers: {'Content-Type': 'application/json', ...?headers},
        ),
      );

      log("POST response: ${response.data}");
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await client.put(
        path,
        data: jsonEncode(body),
        queryParameters: queryParameters,
        options: Options(
          headers: {'Content-Type': 'application/json', ...?headers},
        ),
      );
      log("PUT response: ${response.data}");
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await client.delete(
        path,
        data: jsonEncode(body),
        queryParameters: queryParameters,
        options: Options(
          headers: {'Content-Type': 'application/json', ...?headers},
        ),
      );
      log("DELETE response: ${response.data}");
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final rawData = response.data?.toString().trim();

    if (rawData == null || rawData.isEmpty) {
      return null;
    }

    if ((rawData.startsWith('{') && rawData.endsWith('}')) ||
        (rawData.startsWith('[') && rawData.endsWith(']'))) {
      try {
        return jsonDecode(rawData);
      } catch (e) {
        log('JSON decode error: $e');
        return {'message': rawData};
      }
    } else {
      return {'message': rawData};
    }
  }

  dynamic _handleDioError(DioException error) {
    log("Dio error: ${error.message}");
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          default:
            throw Exception("Unknown status: ${error.response?.statusCode}");
        }
      case DioExceptionType.cancel:
        throw Exception("Request was cancelled");
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      default:
        throw Exception("Unknown Dio error");
    }
  }
}
