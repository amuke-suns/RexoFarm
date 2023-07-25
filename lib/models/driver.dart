class Driver {
  String id;
  String token;
  String email;
  String firstName;
  String lastName;
  String phone;
  List<String> roles;
  bool verified;

  Driver({
    required this.id,
    required this.token,
    required this.roles,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.verified,
  });

  factory Driver.fromJson(Map<String, dynamic> json, String token) {
    final data = json['data'];

    return Driver(
      id: data['_id'],
      token: token,
      roles: (data["roles"] as List).map((item) => item as String).toList(),
      email: data["email"],
      firstName: data['driver']['firstName'],
      lastName: data['driver']['firstName'],
      phone: data['driver']['phone'],
      verified: data['verified'],
    );
  }
}
