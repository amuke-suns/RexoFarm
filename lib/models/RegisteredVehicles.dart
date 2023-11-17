class RegisteredVehicles {
  final List<RegisteredVehicle> list;

  RegisteredVehicles({required this.list});

  factory RegisteredVehicles.fromJson(List<dynamic> data) {
    return RegisteredVehicles(
      list: data.map((json) => RegisteredVehicle.fromJson(json)).toList(),
    );
  }
}

class RegisteredVehicle {
  final String id;
  final String status;
  final String type;
  final String make;
  final String model;
  final String plate;
  final String driver;
  final DateTime createdAt;
  final DateTime updatedAt;

  RegisteredVehicle({
    required this.id,
    required this.status,
    required this.type,
    required this.make,
    required this.model,
    required this.plate,
    required this.driver,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegisteredVehicle.fromJson(Map<String, dynamic> json) {
    return RegisteredVehicle(
      id: json['_id'],
      status: json['status'],
      type: json['vehicleType'],
      make: json['vehicleMake'],
      model: json['vehicleModel'],
      plate: json['numberPlate'],
      driver: json['driver'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
