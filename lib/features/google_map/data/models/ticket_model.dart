import '../../domain/entities/ticket.dart';
import 'dart:math';

class TicketModel extends Ticket {
  TicketModel({
    required super.id,
    required super.customerName,
    required super.email,
    required super.phone,
    required super.priority,
    required super.lat,
    required super.lng,
  });

  factory TicketModel.fromApi(Map<String, dynamic> json) {
    final random = Random();
    return TicketModel(
      id: json['id'],
      customerName: json['name'],
      email: json['email'],
      phone: json['phone'],
      priority: json['id'] % 2 == 0 ? 'urgent' : 'installation',
      lat: 31.95 + random.nextDouble() * 0.1,
      lng: 35.93 + random.nextDouble() * 0.1,
    );
  }

  Map<String, dynamic> toDb() => {
    'id': id,
    'name': customerName,
    'email': email,
    'phone': phone,
    'priority': priority,
    'lat': lat,
    'lng': lng,
  };

  factory TicketModel.fromDb(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      customerName: json['name'],
      email: json['email'],
      phone: json['phone'],
      priority: json['priority'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
