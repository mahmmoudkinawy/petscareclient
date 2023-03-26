import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final String gender;
  final String phoneNumber;
  final String experience;




  Doctor({required this.name, required this.specialty, required this.imageUrl, required this.experience, required this.gender, required this.phoneNumber});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      imageUrl: json['imageUrl'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      experience: json['experience'],
    );
  }
}

class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  List<Doctor> _doctors = [];

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  void _fetchDoctors() async {
    final response =
    await http.get(Uri.parse('http://pets-care.somee.com/api/doctors'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      final doctorsList = jsonList.map((json) => Doctor.fromJson(json)).toList();
      setState(() {
        _doctors = doctorsList;
      });
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: ListView.builder(
        itemCount: _doctors.length,
        itemBuilder: (context, index) {
          final doctor = _doctors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(doctor.imageUrl),
            ),
            title: Text(doctor.name),
            subtitle: Text(doctor.specialty),
            onTap: () {
              // Navigate to doctor's profile page
            },
          );
        },
      ),
    );
  }
}
