class CloseJob {
  final int ticketId;
  final String action;
  final String notes;
  final String imagePath;
  final bool synced;

  CloseJob({
    required this.ticketId,
    required this.action,
    required this.notes,
    required this.imagePath,
    required this.synced,
  });
}
