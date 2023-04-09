import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/clinic.dart';
import '../models/doctor.dart';
import '../models/user.dart';

const String doctorsEndpoint = 'http://pets-care.somee.com/api/doctors';
const String clinicsEndpoint = 'http://pets-care.somee.com/api/clinics';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectedDoctorId = '';
  String selectedClinicId = '';

  List<Doctor> doctors = [];
  List<Clinic> clinics = [];

  Future<void> fetchDoctors() async {
    final user = await getUser();

    try {
      final response = await http.get(Uri.parse(doctorsEndpoint),
          headers: {'Authorization': 'Bearer ${user!.token}'});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final fetchedDoctors = data.map((e) => Doctor.fromJson(e)).toList();

        setState(() {
          doctors = fetchedDoctors;
        });
      } else {
        print('Failed to fetch doctors. Error code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while fetching doctors: $error');
    }
  }

  Future<void> fetchClinics() async {
    final user = await getUser();

    try {
      final response = await http.get(Uri.parse(clinicsEndpoint),
          headers: {'Authorization': 'Bearer ${user!.token}'});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final fetchedClinics = data.map((e) => Clinic.fromJson(e)).toList();

        setState(() {
          clinics = fetchedClinics;
        });
      } else {
        print('Failed to fetch clinics. Error code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while fetching clinics: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDoctors();
    fetchClinics();
  }

  @override
  Widget build(BuildContext context) {
    print('DOCTORS: ${doctors.length}');
    print('CLINICS: ${clinics.length}');
    print('isEmpty doctors: ${clinics.isEmpty}');
    print('isEmpty clinics: ${doctors.isEmpty}');

    if (doctors.isEmpty || clinics.isEmpty) {
      // Display a loading indicator while waiting for the data to be fetched
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final String initialDoctorId = doctors.first.id;
    final List<Clinic> clinicsForInitialDoctor =
        clinics.where((clinic) => clinic.id == initialDoctorId).toList();

    var initialClinicId = clinicsForInitialDoctor.isNotEmpty
        ? clinicsForInitialDoctor.first.id
        : null;

    print('clinicOwnerId: ' + clinics.first.clinicOwnerId);
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedDoctorId.isNotEmpty
                  ? selectedDoctorId
                  : initialDoctorId,
              hint: const Text('Select a doctor'),
              onChanged: (value) {
                setState(() {
                  selectedDoctorId = value!;
                });
              },
              items: doctors
                  .map(
                    (doctor) => DropdownMenuItem<String>(
                      value: doctor.id,
                      child: Text(
                        doctor.fullName,
                      ),
                    ),
                  )
                  .toList(),
            ),
            DropdownButton<String>(
              value: selectedClinicId.isNotEmpty
                  ? selectedClinicId
                  : initialClinicId,
              hint: const Text(
                'Select a clinic',
              ),
              onChanged: (value) {
                setState(
                  () {
                    selectedClinicId = value!;
                  },
                );
              },
              items: clinics
                  .where((clinic) => clinic.clinicOwnerId == selectedDoctorId)
                  .map(
                    (clinic) => DropdownMenuItem<String>(
                      value: clinic.id,
                      child: Text(clinic.name),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
