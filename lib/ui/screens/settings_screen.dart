import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDarkTheme) {
          return Column(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: isDarkTheme,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(ThemeEvent.toggle);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
