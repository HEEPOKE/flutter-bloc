import 'package:flutter/material.dart';

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
                Icon(Icons.home),
                SizedBox(width: 8),
                Text("Home"),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 8),
                Text("Settings"),
              ],
            ),
            onTap: () {},
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
