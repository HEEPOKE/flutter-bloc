import 'package:app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.manage_accounts),
                SizedBox(width: 8),
                Text("Profile"),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 8),
                Text("Settings"),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8),
                Text("Logout"),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
