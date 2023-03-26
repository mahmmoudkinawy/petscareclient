import 'package:flutter/material.dart';
import 'package:petscareclient/profile_screen/view/profile_screen.dart';
import 'package:petscareclient/src/screens/home_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
  bool _isTap = false;
class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "common",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Language'),
                    trailing: Text(
                      "English",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.cloud,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Environment'),
                    trailing: Text(
                      "Production",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.devices,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Platform'),
                    trailing: Text(
                      "Default",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.format_paint,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Enable custom theme'),
                      value: false,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Contact us",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Phone number'),
                    subtitle: Text(
                      "01155987379",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue.shade900,
                    ),
                    title: Text('Email'),
                    subtitle: Text(
                      "nmuhamed454@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Security",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.screen_lock_portrait_sharp,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text(
                        'Lock app in packground',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: true,
                      onChanged: (bool value) {}),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.fingerprint,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Use fingerprint'),
                      value: true,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Allow application to stored fingerprint IDs",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.password,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Change password'),
                      value: false,
                      onChanged: (bool value) {}),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.notifications_active,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Enable notifications'),
                      value: true,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Navigate to search screen
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings,color: _isTap?Colors.white:Colors.indigo),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
