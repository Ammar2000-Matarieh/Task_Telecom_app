import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected async =>
      await connectionChecker.hasConnection ? await checkConnection() : false;

  Future<bool> checkConnection() async {
    try {
      final res = await InternetAddress.lookup(
        'www.primavera.com',
      );
      if (res.isNotEmpty && res.first.rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
