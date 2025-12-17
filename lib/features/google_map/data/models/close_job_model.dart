import '../../domain/entities/close_job.dart';

class CloseJobModel extends CloseJob {
  CloseJobModel({
    required super.ticketId,
    required super.action,
    required super.notes,
    required super.imagePath,
    required super.synced,
  });

  Map<String, dynamic> toDb() => {
    'ticket_id': ticketId,
    'action': action,
    'notes': notes,
    'image_path': imagePath,
    'synced': synced ? 1 : 0,
  };

  factory CloseJobModel.fromDb(Map<String, dynamic> json) {
    return CloseJobModel(
      ticketId: json['ticket_id'],
      action: json['action'],
      notes: json['notes'],
      imagePath: json['image_path'],
      synced: json['synced'] == 1,
    );
  }
}
