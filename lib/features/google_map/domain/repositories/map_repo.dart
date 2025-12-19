import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

abstract class MapRepo {
  Future<List<TicketModel>> getTicketsLocations();
}
