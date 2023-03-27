import 'package:flutter/material.dart';

class ManageClinicsScreen extends StatefulWidget {
  const ManageClinicsScreen({Key? key}) : super(key: key);

  @override
  State<ManageClinicsScreen> createState() => _ManageClinicsState();
}

class _ManageClinicsState extends State<ManageClinicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Clinics'),
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
              child: ListView.builder(
                itemCount: 5, // Replace with actual count of clinics
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: const Text('Clinic Name'),
                      subtitle: const Text('Clinic Address'),
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
                              // Show a confirmation dialog before deleting
                            },
                            icon: const Icon(Icons.delete),
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
