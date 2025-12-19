import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());

  Future<void> loadDistance({
    required double ticketLat,
    required double ticketLng,
  }) async {
    emit(GoogleMapLoading());

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(GoogleMapPermissionDenied());
        return;
      }

      final pos = await Geolocator.getCurrentPosition();

      final distance =
          Geolocator.distanceBetween(
            pos.latitude,
            pos.longitude,
            ticketLat,
            ticketLng,
          ) /
          1000;

      emit(GoogleMapLoaded(distance: distance));
    } catch (e) {
      emit(GoogleMapError());
    }
  }
}
