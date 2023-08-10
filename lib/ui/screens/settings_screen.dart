import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SettingsScreen extends StatefulWidget {
final FlutterLocalNotificationsPlugin notificationsPlugin;

  SettingsScreen({Key? key, required this.notificationsPlugin}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  int? _selectedTheme = 0;
  final List<String> _themes = ['Light', 'Dark', 'System Default'];

  Widget _buildNotificationsOption() {
    return ListTile(
      title: const Text('Enable Notifications'),
      subtitle: const Text('Receive notifications for updates'),
      trailing: Switch(
        value: _notificationsEnabled,
        onChanged: (value) {
          setState(() {
            _notificationsEnabled = value;
            if (_notificationsEnabled) {
              _showNotification();
            }
          });
        },
      ),
    );
  }

  Widget _buildThemeOption() {
    return ListTile(
      title: const Text('Select Theme'),
      trailing: DropdownButton<int>(
        value: _selectedTheme,
        items: _themes.map((theme) {
          return DropdownMenuItem<int>(
            value: _themes.indexOf(theme),
            child: Text(theme),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedTheme = value;
          });
        },
      ),
    );
  }

  void _showNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      // 'Channel Description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidDetails);

    await widget.notificationsPlugin.show(
      0, // Notification ID
      'Notification Title',
      'Notification Body',
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildNotificationsOption();
          } else if (index == 1) {
            return _buildThemeOption();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
