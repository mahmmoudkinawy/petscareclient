class Clinic {
  String id;
  String name;
  String address;
  String phoneNumber;
  String openingTime;
  String closingTime;
  String clinicOwnerId;

  Clinic(
      {required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.openingTime,
      required this.closingTime,
      required this.clinicOwnerId});

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      openingTime: json['openingTime'] as String,
      closingTime: json['closingTime'] as String,
      clinicOwnerId: json['clinicOwnerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'clinicOwnerId': clinicOwnerId,
    };
  }

  void setName(String newName) {
    name = newName;
  }
}
