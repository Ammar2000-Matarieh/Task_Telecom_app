// enum TicketPriority { urgent, installation }

class TicketModel {
  final int id;
  final String customerName;
  final String email;
  final String phone;
  final double lat;
  final double lng;
  // final TicketPriority priority;

  TicketModel({
    required this.id,
    required this.customerName,
    required this.email,
    required this.phone,
    required this.lat,
    required this.lng,
    // required this.priority,
  });

  factory TicketModel.fromApi(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      customerName: json['name'],
      email: json['email'],
      phone: json['phone'],
      lat: double.parse(json['address']['geo']['lat']),
      lng: double.parse(json['address']['geo']['lng']),
      // priority: json['id'] % 2 == 0
      //     ? TicketPriority.urgent
      //     : TicketPriority.installation,
    );
  }

  factory TicketModel.fromDb(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'],
      customerName: map['customer_name'],
      email: map['email'],
      phone: map['phone'],
      lat: map['lat'],
      lng: map['lng'],
      // priority: TicketPriority.values.firstWhere(
      //   (e) => e.name == map['priority'],
      // ),
    );
  }

  Map<String, dynamic> toDb() => {
    'id': id,
    'customer_name': customerName,
    'email': email,
    'phone': phone,
    'lat': lat,
    'lng': lng,
    // 'priority': priority.name, // urgent / installation
  };
}
