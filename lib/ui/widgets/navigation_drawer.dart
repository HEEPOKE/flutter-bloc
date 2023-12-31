import 'package:flutter/material.dart';
import 'package:app/ui/screens/profile_screen.dart';
import 'package:app/ui/screens/settings_screen.dart';

import '../../services/navigation_serevice.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(IconData icon, String title, Function() onTap) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
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
            () => NavigationService.navigateTo(context, const ProfileScreen()),
          ),
          _buildListTile(
            Icons.settings,
            "Settings",
            () => NavigationService.navigateTo(context, const SettingsScreen()),
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