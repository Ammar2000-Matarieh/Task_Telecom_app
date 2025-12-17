part of 'google_map_cubit.dart';

abstract class GoogleMapState extends Equatable {
  const GoogleMapState();

  @override
  List<Object> get props => [];
}

class GoogleMapInitial extends GoogleMapState {}

class MapLoading extends GoogleMapState {}

class MapLoaded extends GoogleMapState {
  final List<Ticket> tickets;
  const MapLoaded(this.tickets);
}

class MapError extends GoogleMapState {}
