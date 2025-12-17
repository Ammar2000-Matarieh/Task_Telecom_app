import 'package:telecom_support_app/features/google_map/domain/entities/ticket.dart';

abstract class MapRepo {
  Future<List<Ticket>> getTicketsLocations();
}
