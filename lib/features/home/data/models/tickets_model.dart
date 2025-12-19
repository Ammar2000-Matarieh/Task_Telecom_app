class TicketModel {
  final int id;
  final String customerName;
  final String email;
  final String phone;
  final String priority;
  final double lat;
  final double lng;

  TicketModel({
    required this.id,
    required this.customerName,
    required this.email,
    required this.phone,
    required this.priority,
    required this.lat,
    required this.lng,
  });

  factory TicketModel.fromApi(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final priority = id % 2 == 0 ? 'urgent' : 'installation';
    final loc = AmmanLocations.pick(id);

    return TicketModel(
      id: id,
      customerName: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      priority: priority,
      lat: loc.$1,
      lng: loc.$2,
    );
  }

  Map<String, dynamic> toDb() => {
    'id': id,
    'customer_name': customerName,
    'email': email,
    'phone': phone,
    'priority': priority,
    'lat': lat,
    'lng': lng,
  };

  factory TicketModel.fromDb(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'],
      customerName: map['customer_name'],
      email: map['email'],
      phone: map['phone'],
      priority: map['priority'],
      lat: map['lat'],
      lng: map['lng'],
    );
  }
}

class AmmanLocations {
  static const List<(double, double)> _list = [
    (31.9539, 35.9106), // Abdoun
    (31.9862, 35.8778), // Sweifieh
    (31.9653, 35.8439), // Khalda
    (31.9950, 35.8640), // Tla' Al-Ali
    (31.9516, 35.9393), // Al-Weibdeh
    (31.9456, 35.9284), // Downtown
    (31.8938, 35.9304), // Airport road area
  ];

  static (double, double) pick(int id) => _list[id % _list.length];
}
