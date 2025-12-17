import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class MapScreen extends StatelessWidget {
  final TicketModel ticket;

  const MapScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    //markerColor
    // final markerColor = ticket.priority == 'urgent'
    //     ? BitmapDescriptor.hueRed
    //     : BitmapDescriptor.hueBlue;

    return Scaffold(
      appBar: AppBar(title: const Text("Ticket Location")),
      body: Column(
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
                  markerId: const MarkerId("ticket_marker"),
                  position: LatLng(ticket.lat, ticket.lng),
                  icon: BitmapDescriptor.defaultMarkerWithHue(20.9),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Distance from you: 3.4 km",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
