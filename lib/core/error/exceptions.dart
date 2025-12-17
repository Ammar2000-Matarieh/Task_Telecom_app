import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

class FetchDataException extends ServerException {
  // ignore: strict_top_level_inference
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  // ignore: strict_top_level_inference
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  // ignore: strict_top_level_inference
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerException {
  // ignore: strict_top_level_inference
  const NotFoundException([message]) : super("Requested Info Not Found");
}

class ConflictException extends ServerException {
  // ignore: strict_top_level_inference
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  // ignore: strict_top_level_inference
  const InternalServerErrorException([message])
    : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  // ignore: strict_top_level_inference
  const NoInternetConnectionException([message])
    : super("No Internet Connection");
}

class CacheException implements Exception {}
