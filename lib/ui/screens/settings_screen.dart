import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int? _selectedTheme = 0;
  final List<String> _themes = ['Light', 'Dark', 'System Default'];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildThemeOption();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
