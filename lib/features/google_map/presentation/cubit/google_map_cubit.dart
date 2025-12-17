import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/features/google_map/domain/entities/ticket.dart';
import 'package:telecom_support_app/features/google_map/domain/usecases/get_ticket_locations.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  final GetTicketLocations useCase;

  GoogleMapCubit(this.useCase) : super(GoogleMapInitial());

  Future<void> load() async {
    emit(MapLoading());
    try {
      final res = await useCase();
      emit(MapLoaded(res));
    } catch (_) {
      emit(MapError());
    }
  }
}
