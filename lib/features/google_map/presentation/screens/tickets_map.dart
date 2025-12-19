import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/google_map_cubit.dart';
import 'package:telecom_support_app/features/google_map/presentation/widgets/custom_tickets_map.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class MapScreen extends StatelessWidget {
  final TicketModel ticket;

  const MapScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          context.read<GoogleMapCubit>()
            ..loadDistance(ticketLat: ticket.lat, ticketLng: ticket.lng),
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.ticketLocation)),
        body: CustomTicketsMapWidget(ticket: ticket),
      ),
    );
  }
}
