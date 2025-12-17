import 'package:flutter/material.dart';
import 'package:telecom_support_app/config/routes/app_routes.dart';
import 'package:telecom_support_app/core/extensions/size.dart';
import 'package:telecom_support_app/features/google_map/presentation/screens/close_job_page.dart';
import 'package:telecom_support_app/features/google_map/presentation/screens/tickets_map_page.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class TicketsDetails extends StatelessWidget {
  final TicketModel ticket;

  const TicketsDetails({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Details"),
        leading: IconButton(
          onPressed: () => back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                border: Border.all(width: 0.5),
              ),
              child: ListTile(
                title: Text("Customer: ${ticket.customerName}"),
                subtitle: Text("Email: ${ticket.email}"),
                trailing: Text("Phone: ${ticket.phone}"),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MapScreen(ticket: ticket),
                        ),
                      );
                    },
                    child: const Text("View on Map"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 2.h),

            // const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CloseJobScreen(ticket: ticket),
                        ),
                      );
                    },
                    child: const Text("Close Job"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
