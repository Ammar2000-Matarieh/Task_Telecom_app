import 'package:telecom_support_app/features/google_map/domain/repositories/map_repo.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class GetTicketLocations {
  final MapRepo repo;

  GetTicketLocations(this.repo);

  Future<List<TicketModel>> call() {
    return repo.getTicketsLocations();
  }
}
