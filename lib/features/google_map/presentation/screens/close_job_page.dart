import 'package:flutter/material.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';
import 'package:image_picker/image_picker.dart';

class CloseJobScreen extends StatefulWidget {
  final TicketModel ticket;

  const CloseJobScreen({super.key, required this.ticket});

  @override
  State<CloseJobScreen> createState() => _CloseJobScreenState();
}

class _CloseJobScreenState extends State<CloseJobScreen> {
  String? selectedAction;
  XFile? pickedImage;
  final notesController = TextEditingController();

  final actions = [
    "Installation completed",
    "Issue fixed",
    "No issue found",
    "Customer was not available",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Close Job")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Action Taken
            DropdownButtonFormField<String>(
              hint: const Text("Action Taken"),
              initialValue: selectedAction,
              items: actions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedAction = val),
            ),

            const SizedBox(height: 16),

            /// Pick Image
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: Text(
                pickedImage == null ? "Pick Proof Image" : "Image Selected ✔",
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  setState(() => pickedImage = image);
                }
              },
            ),

            const SizedBox(height: 16),

            /// Notes
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Notes",
                border: OutlineInputBorder(),
              ),
            ),

            const Spacer(),

            /// Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 🔴 Offline → save local
                  // 🟢 Online → send API
                  Navigator.pop(context);
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
