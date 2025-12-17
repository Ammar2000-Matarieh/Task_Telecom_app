import 'package:dartz/dartz.dart';
import 'package:telecom_support_app/core/error/failures.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';
import 'package:telecom_support_app/features/home/domain/repositories/home_repo.dart';

class HomeUseCase {
  final HomeRepo homeRepo;

  HomeUseCase({required this.homeRepo});

  Future<Either<Failure, List<TicketModel>>> call() async {
    return await homeRepo.getActiveTickets();
  }
}
