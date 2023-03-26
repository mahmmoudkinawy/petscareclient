class Doctor {
  final String id;
  final String fullName;
  final String imageUrl;
  final String phoneNumber;
  final String specialty;

  Doctor({
    required this.id,
    required this.fullName,
    required this.imageUrl,
    required this.phoneNumber,
    required this.specialty,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      fullName: json['fullName'],
      imageUrl: json['imageUrl'],
      phoneNumber: json['phoneNumber'],
      specialty: json['specialty'],
    );
  }
}
