import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/user.dart';

class ClinicsScreen extends StatefulWidget {
  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  List<dynamic> _clinics = [];

  @override
  void initState() {
    super.initState();
    _fetchClinics();
  }

  Future<void> _fetchClinics() async {
    final user = await getUser();

    final response = await http.get(
        Uri.parse('http://pets-care.somee.com/api/clinics'),
        headers: {'Authorization': 'Bearer ${user!.token}'});

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _clinics = jsonResponse;
      });
    } else {
      throw Exception('Failed to fetch clinics');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinics'),
      ),
      body: _clinics.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _clinics.length,
              itemBuilder: (BuildContext context, int index) {
                final clinic = _clinics[index];

                final openingTime =
                    DateFormat('HH:mm:ss').parse(clinic['openingTime']);
                final closingTime =
                    DateFormat('HH:mm:ss').parse(clinic['closingTime']);

                final formattedOpeningTime =
                    DateFormat('h:mm a').format(openingTime);
                final formattedClosingTime =
                    DateFormat('h:mm a').format(closingTime);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(clinic['name']),
                          subtitle: Text(
                            clinic['address'],
                          ),
                          trailing: Text(
                            clinic['phoneNumber'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                'Opening time: $formattedOpeningTime',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Closing time: $formattedClosingTime',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
