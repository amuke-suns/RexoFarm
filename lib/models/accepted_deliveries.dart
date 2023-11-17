import 'package:rexofarm/models/delivery_status.dart';

class AcceptedDeliveries {
  final List<ParticularDelivery> list;

  AcceptedDeliveries({required this.list});

  factory AcceptedDeliveries.fromJson(List<dynamic> data) {
    return AcceptedDeliveries(
      list: data.map((json) => ParticularDelivery.fromJson(json)).toList(),
    );
  }
}

class ParticularDelivery {
  final String id;
  final DeliveryStatus status;
  final String orderId;
  final String pickupLocation;
  final String destination;
  final String buyer;
  final String seller;
  final List<Item> items;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? driver;

  ParticularDelivery({
    required this.id,
    required this.status,
    required this.orderId,
    required this.pickupLocation,
    required this.destination,
    required this.buyer,
    required this.seller,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.driver,
  });

  factory ParticularDelivery.fromJson(Map<String, dynamic> json) {
    final itemsList = (json['items'] as List<dynamic>)
        .map((itemJson) => Item.fromJson(itemJson))
        .toList();

    return ParticularDelivery(
      id: json['_id'],
      status: DeliveryStatus.values.firstWhere(
            (element) => element.value == json['status'],
      ),
      orderId: json['orderId'],
      pickupLocation: json['pickupLocation'],
      destination: json['destination'],
      buyer: json['buyer'],
      seller: json['seller'],
      items: itemsList,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      driver: json['driver'] // this is null when delivery is unassigned,
    );
  }
}

class Item {
  final String item;
  final int quantity;

  Item({
    required this.item,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      item: json['item'],
      quantity: json['quantity'],
    );
  }
}

extension ListExtensions on List<Item> {
  String getItemNames() {
    String strItems = "";
    for (Item item in this) {
      strItems += "${item.item}, ";
    }
    return strItems.substring(0, strItems.length - 2);
  }

  String getItemQty() {
    String strQty = "";
    for (Item item in this) {
      strQty += "${item.quantity},";
    }
    return strQty.substring(0, strQty.length - 2);
  }
}

