import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/screens/home_screen.dart';
import 'bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, isDarkTheme) {
        return MaterialApp(
          title: 'My App',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.lightBlue,
          ),
          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
