import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/doctor.dart';
import '../models/user.dart';
import 'doctor_details_screen.dart';

class DoctorsScreen extends StatefulWidget {
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  List<Doctor> _doctors = [];

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  void _fetchDoctors() async {
    final user = await getUser();

    final response = await http.get(
        Uri.parse('http://pets-care.somee.com/api/doctors'),
        headers: {'Authorization': 'Bearer ${user!.token}'});

    print('Token: ${user.token}');

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      final doctorsList =
          jsonList.map((json) => Doctor.fromJson(json)).toList();
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
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Available Doctors',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
              children: _doctors.map(
                (doctor) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorDetailsScreen(doctor: doctor),
                        ),
                      );
                    },
                    child: FutureBuilder(
                      future: precacheImage(
                          NetworkImage(doctor.imageUrl!), context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Card(
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                    child: Image.network(
                                      doctor.imageUrl!,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor.fullName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        doctor.specialty,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Card(
                            elevation: 2,
                            child: Container(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
