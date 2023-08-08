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
            title: const Text("Item 1"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Item 2"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
