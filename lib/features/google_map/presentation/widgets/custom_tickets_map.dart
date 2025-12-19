import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/google_map_cubit.dart';
import 'package:telecom_support_app/features/google_map/presentation/widgets/bitmap_descriptor.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class CustomTicketsMapWidget extends StatelessWidget {
  final TicketModel ticket;
  const CustomTicketsMapWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, state) {
        if (state is GoogleMapLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GoogleMapPermissionDenied) {
          return Center(child: Text(AppStrings.locationPermissionDeniedKey));
        }

        if (state is GoogleMapLoaded) {
          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(ticket.lat, ticket.lng),
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId(ticket.id.toString()),
                      position: LatLng(ticket.lat, ticket.lng),
                      icon: markerByPriority(ticket.priority),
                      infoWindow: InfoWindow(title: ticket.customerName),
                    ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  state.distance == null
                      ? AppStrings.distanceUnavailableKey
                      : "${AppStrings.distanceFromYouKey}: ${state.distance!.toStringAsFixed(2)} ${AppStrings.kmKey}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        }

        if (state is GoogleMapError) {
          return Center(child: Text(AppStrings.somethingWentKey));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
