import '../widgets/shipment_card.dart';

class ShipmentsMock {
  List<Shipment> list;

  ShipmentsMock({
    required this.list,
  });

  factory ShipmentsMock.fromJson(List<dynamic> data) {
    return ShipmentsMock(
      list: data
          .map(
            (json) => Shipment(
              name: json['name'],
              address: json['address'],
              status: ShipmentStatus.values[json['status']],
              date: DateTime.parse(json['date']),
            ),
          )
          .toList(),
    );
  }
}

extension ShipmentExtensions on List<Shipment> {
  List<Shipment> getLatest() {
    return where((element) => element.status == ShipmentStatus.latest).toList();
  }

  List<Shipment> getAccepted() {
    return where((element) => element.status == ShipmentStatus.accepted)
        .toList();
  }

  List<Shipment> getCompleted() {
    return where((element) => element.status == ShipmentStatus.completed)
        .toList();
  }

  List<Shipment> getOngoing() {
    return where((element) => element.status == ShipmentStatus.ongoing)
        .toList();
  }

  List<Shipment> getToday() {
    return where((element) => element.date.day == DateTime.now().day).toList();
  }

  List<Shipment> getYesterday() {
    return where((element) =>
        element.date.day ==
        DateTime.now().subtract(const Duration(days: 1)).day).toList();
  }

  List<Shipment> getOlder() {
    return where((element) {
      final day = element.date.day;
      final dateNow = DateTime.now();
      return day != dateNow.day &&
          day != dateNow.subtract(const Duration(days: 1)).day;
    }).toList();
  }
}

class Shipment {
  final String name;
  final String address;
  final ShipmentStatus status;
  final DateTime date;

  Shipment({
    required this.name,
    required this.address,
    required this.status,
    required this.date,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      name: json['name'],
      address: json['address'],
      status: json['status'],
      date: DateTime.parse(json['date']),
    );
  }
}
