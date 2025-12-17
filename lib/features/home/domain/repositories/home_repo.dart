import 'package:dartz/dartz.dart';
import 'package:telecom_support_app/core/error/failures.dart';
import 'package:telecom_support_app/core/network/network_info.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

abstract class HomeRepo {
  NetworkInfo get networkInfo;
  Future<Either<Failure, List<TicketModel>>> getActiveTickets();
}
