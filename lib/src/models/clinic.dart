class Clinic {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final String openingTime;
  final String closingTime;

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.openingTime,
    required this.closingTime,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      openingTime: json['openingTime'],
      closingTime: json['closingTime'],
    );
  }
}
