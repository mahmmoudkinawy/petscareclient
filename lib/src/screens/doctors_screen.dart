import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petscareclient/profile_screen/view/aboutus_screen.dart';
import 'package:petscareclient/profile_screen/view/privasypolicy.dart';
import 'package:petscareclient/profile_screen/view/setting_screen.dart';

import '../models/doctor.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List<Doctor> _doctors = [];

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    final response =
        await http.get(Uri.parse('http://pets-care.somee.com/api/doctors'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final doctors = data.map((json) => Doctor.fromJson(json)).toList();
      setState(() {
        _doctors = doctors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_doctors == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Doctors'),
        ),
        body:
        Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.favorite_border_sharp,
                color: Colors.blue.shade900,
              ),
              title: Text('Favorite meals'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            // ListView.builder(
            //   itemCount: _doctors.length,
            //   itemBuilder: (context, index) {
            //     final doctor = _doctors[index];
            //     return DoctorCard(
            //         name: doctor.fullName,
            //         image: doctor.imageUrl,
            //         phone: doctor.phoneNumber,
            //         specialty: doctor.specialty);
            //   },
            // ),
          ],
        ),

      );
    }
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String image;
  final String phone;
  final String specialty;

  DoctorCard({
    required this.name,
    required this.image,
    required this.phone,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        child: InkWell(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  image,
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    specialty,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    phone,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
