import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Account'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            const ListTile(
              leading: Icon(Icons.edit),
              title: Text('Profile Edit'),
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy'),
            ),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
            ),
            const ListTile(
              leading: Icon(Icons.security),
              title: Text('Security'),
            ),
            const ListTile(
              leading: Icon(Icons.ad_units),
              title: Text('Ads'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Accounts'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/carcare_1.png',
                height: 25,
                width: 100,
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                'version 1.0.0',
                style: TextStyle(
                  color: Color.fromARGB(150, 90, 90, 90),
                  fontSize: 12,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
