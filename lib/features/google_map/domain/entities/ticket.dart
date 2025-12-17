class Ticket {
  final int id;
  final String customerName;
  final String email;
  final String phone;
  final String priority;
  final double lat;
  final double lng;

  Ticket({
    required this.id,
    required this.customerName,
    required this.email,
    required this.phone,
    required this.priority,
    required this.lat,
    required this.lng,
  });
}
