import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/clinic.dart';
import '../models/user.dart';

class ManageClinicsScreen extends StatefulWidget {
  const ManageClinicsScreen({Key? key}) : super(key: key);

  @override
  _ManageClinicsScreenState createState() => _ManageClinicsScreenState();
}

class _ManageClinicsScreenState extends State<ManageClinicsScreen> {
  List<Clinic> _clinics = [];

  @override
  void initState() {
    super.initState();
    _fetchClinics();
  }

  Future<void> _fetchClinics() async {
    final user = await getUser();

    final response = await http.get(
      Uri.parse('http://pets-care.somee.com/api/clinics/current-user-clinics'),
      headers: {'Authorization': 'Bearer ${user!.token}'},
    );

    if (response.statusCode == 200) {
      final clinicsJson = jsonDecode(response.body) as List<dynamic>;
      final clinics = clinicsJson.map((json) => Clinic.fromJson(json)).toList();
      setState(() {
        _clinics = clinics;
      });
    } else {
      throw Exception('Failed to fetch clinics');
    }
  }

  Future<void> _deleteClinic(int clinicId) async {
    final user = await getUser();

    final response = await http.delete(
      Uri.parse('http://pets-care.somee.com/api/clinics/$clinicId'),
      headers: {'Authorization': 'Bearer ${user!.token}'},
    );

    if (response.statusCode == 204) {
      // Clinic deleted successfully
      setState(() {
        _clinics.removeWhere((clinic) => clinic.id == clinicId);
      });
    } else {
      // Failed to delete clinic
      throw Exception('Failed to delete clinic');
    }
  }

  Future<void> _confirmDeleteClinic(int clinicId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this clinic?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _deleteClinic(clinicId);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete clinic')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Your Clinics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the screen to create a new clinic
              },
              child: const Text('Add Clinic'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: _clinics.isEmpty
                  ? const Center(
                      child: Text('You don\'t have Clinics.'),
                    )
                  : ListView.builder(
                      itemCount: _clinics.length,
                      itemBuilder: (BuildContext context, int index) {
                        final clinic = _clinics[index];
                        return Card(
                          child: ListTile(
                            title: Text(clinic.name),
                            subtitle: Text(clinic.address),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Navigate to the screen to edit the clinic
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Confirm'),
                                        content: const Text(
                                          'Are you sure you want to delete this clinic?',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.of(
                                              context,
                                            ).pop(),
                                            child: const Text(
                                              'Cancel',
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              final user = await getUser();

                                              final response =
                                                  await http.delete(
                                                Uri.parse(
                                                    'http://pets-care.somee.com/api/clinics/${clinic.id}'),
                                                headers: {
                                                  'Authorization':
                                                      'Bearer ${user!.token}'
                                                },
                                              );

                                              if (response.statusCode == 204) {
                                                setState(() {
                                                  _clinics.removeAt(index);
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Failed to delete the clinic.',
                                                    ),
                                                  ),
                                                );
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
