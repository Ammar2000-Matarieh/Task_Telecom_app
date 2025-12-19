import 'package:telecom_support_app/features/close/domain/entities/close_job.dart';

class CloseJobModel extends CloseJob {
  final int? rowId; // 👈 id from sqlite
  final int synced;
  final int createdAt;
  CloseJobModel({
    this.rowId,
    required super.ticketId,
    required super.action,
    required super.notes,
    required super.imagePath,
    this.synced = 0,
    int? createdAt,
  }) : createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toDb() => {
    if (rowId != null) 'id': rowId,
    'ticket_id': ticketId,
    'action': action,
    'notes': notes,
    'image_path': imagePath,
    'synced': synced,
    'created_at': createdAt,
  };

  factory CloseJobModel.fromDb(Map<String, dynamic> json) {
    return CloseJobModel(
      rowId: json['id'] as int?,
      ticketId: json['ticket_id'] as int,
      action: json['action'] as String,
      notes: (json['notes'] ?? '') as String,
      imagePath: json['image_path'] as String,
      synced: (json['synced'] ?? 0) as int,
      createdAt: (json['created_at'] ?? 0) as int,
    );
  }
}
