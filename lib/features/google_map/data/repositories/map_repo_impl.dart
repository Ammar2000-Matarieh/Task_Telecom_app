import 'package:telecom_support_app/core/network/network_info.dart';
import 'package:telecom_support_app/features/google_map/domain/entities/ticket.dart';
import 'package:telecom_support_app/features/google_map/domain/repositories/map_repo.dart';
import 'package:telecom_support_app/features/home/data/datasources/home_repo_remote_data_source.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class MapRepoImpl implements MapRepo {
  final HomeRepoLocalDataSource local;
  final HomeRepoRemoteDataSource remote;
  final NetworkInfo networkInfo;

  MapRepoImpl(this.local, this.remote, this.networkInfo);

  @override
  Future<List<Ticket>> getTicketsLocations() async {
    if (await networkInfo.isConnected) {
      final List<TicketModel> models = await remote.getUsersTickets();
      await local.cacheTickets(models);

      // 🔥 Model → Entity
      return models.map((e) => _mapToEntity(e)).toList();
    } else {
      final List<TicketModel> cached = await local.getCachedTickets();

      // 🔥 Model → Entity
      return cached.map((e) => _mapToEntity(e)).toList();
    }
  }

  Ticket _mapToEntity(TicketModel model) {
    return Ticket(
      id: model.id,
      customerName: model.customerName,
      email: model.email,
      phone: model.phone,
      priority: "",
      lat: model.lat,
      lng: model.lng,
    );
  }
}
