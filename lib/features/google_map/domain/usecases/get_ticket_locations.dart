import 'package:telecom_support_app/features/google_map/domain/entities/ticket.dart';
import 'package:telecom_support_app/features/google_map/domain/repositories/map_repo.dart';

class GetTicketLocations {
  final MapRepo repo;

  GetTicketLocations(this.repo);

  Future<List<Ticket>> call() {
    return repo.getTicketsLocations();
  }
}
