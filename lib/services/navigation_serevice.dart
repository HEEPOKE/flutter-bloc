import 'package:flutter/material.dart';

class NavigationService {
  static Future<void> navigateTo(BuildContext context, Widget destination) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }
}
