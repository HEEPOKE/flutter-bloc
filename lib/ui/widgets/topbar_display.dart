import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData avatarIcon;

  const TopAppBar({required this.title, required this.avatarIcon, Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {

        },
      ),
      actions: [
        IconButton(
          icon: Icon(avatarIcon),
          onPressed: () {
          },
        ),
      ],
    );
  }
}
