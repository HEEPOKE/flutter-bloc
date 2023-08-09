import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  int? _selectedTheme = 0;
  final List<String> _themes = ['Light', 'Dark', 'System Default'];

  Widget _buildOption(String title, Widget content) {
    return ListTile(
      title: Text(title),
      trailing: content, // Set the dropdown as the trailing widget
    );
  }

  Widget _buildNotificationsOption() {
    return ListTile(
      title: const Text('Enable Notifications'),
      subtitle: const Text('Receive notifications for updates'),
      trailing: Switch(
        value: _notificationsEnabled,
        onChanged: (value) {
          setState(() {
            _notificationsEnabled = value;
          });
        },
      ),
    );
  }

  Widget _buildThemeOption() {
    return _buildOption(
      'Select Theme',
      DropdownButton<int>(
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