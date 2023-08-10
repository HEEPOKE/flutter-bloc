import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:app/ui/screens/profile_screen.dart';
import 'package:app/ui/screens/settings_screen.dart';

class NavigationDrawer extends StatelessWidget {
  final FlutterLocalNotificationsPlugin notificationsPlugin;

  const NavigationDrawer({Key? key, required this.notificationsPlugin}) : super(key: key);

  Widget _buildListTile(IconData icon, String title, Function() onTap) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      onTap: onTap,
    );
  }

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
          _buildListTile(
            Icons.manage_accounts,
            "Profile",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          _buildListTile(
            Icons.settings,
            "Settings",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen(notificationsPlugin: notificationsPlugin)),
              );
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          _buildListTile(
            Icons.logout,
            "Logout",
            () {},
          ),
        ],
      ),
    );
  }
}
