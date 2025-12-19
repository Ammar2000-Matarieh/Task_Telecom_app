part of 'google_map_cubit.dart';

abstract class GoogleMapState extends Equatable {
  const GoogleMapState();

  @override
  List<Object?> get props => [];
}

class GoogleMapInitial extends GoogleMapState {}

class GoogleMapLoading extends GoogleMapState {}

class GoogleMapLoaded extends GoogleMapState {
  final double? distance;

  const GoogleMapLoaded({required this.distance});

  @override
  List<Object?> get props => [distance];
}

class GoogleMapPermissionDenied extends GoogleMapState {}

class GoogleMapError extends GoogleMapState {}
