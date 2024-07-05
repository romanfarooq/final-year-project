import 'package:car_care/routes/app_routes.dart';
import 'package:car_care/utils/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ToastMessage().toastmessage('Logged out');
    } catch (error) {
      ToastMessage().toastmessage('Error logging out: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            kToolbarHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      leading: Icon(Icons.help),
                      title: Text('Help'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () async {
                        await _logout(context);
                        if (context.mounted) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.selectUserScreen,
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Image.asset(
                    'assets/images/carcare_1.png',
                    height: 25,
                    width: 100,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Container(
                  width: double.infinity,
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
