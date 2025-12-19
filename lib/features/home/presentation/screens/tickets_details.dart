import 'package:flutter/material.dart';
import 'package:telecom_support_app/config/routes/app_routes.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';
import 'package:telecom_support_app/features/home/presentation/widgets/custom_details.dart';

class TicketsDetails extends StatelessWidget {
  final TicketModel ticket;

  const TicketsDetails({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.ticketDetails),
        leading: IconButton(
          onPressed: () => back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: CustomDetailsWidget(ticket: ticket),
    );
  }
}
