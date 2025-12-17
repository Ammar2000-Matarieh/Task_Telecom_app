import 'package:dartz/dartz.dart';
import 'package:telecom_support_app/core/error/failures.dart';
import 'package:telecom_support_app/core/network/network_info.dart';
import 'package:telecom_support_app/features/home/data/datasources/home_repo_remote_data_source.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';
import 'package:telecom_support_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  final NetworkInfo networkInfo;
  final HomeRepoRemoteDataSource remote;
  final HomeRepoLocalDataSource local;

  HomeRepoImpl({
    required this.remote,
    required this.local,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TicketModel>>> getActiveTickets() async {
    if (await networkInfo.isConnected) {
      try {
        final tickets = await remote.getUsersTickets();
        await local.cacheTickets(tickets);
        return Right(tickets);
      } catch (_) {
        return Left(ServerFailure(error: ""));
      }
    } else {
      try {
        final cached = await local.getCachedTickets();
        return Right(cached);
      } catch (_) {
        return Left(CacheFailure(error: ""));
      }
    }
  }
}
