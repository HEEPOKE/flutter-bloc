import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_bloc.dart';
import '../widgets/topbar_display.dart';
import '../widgets/navigation_drawer.dart' as nav_drawer;

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: HomeScreenBody(scaffoldKey: scaffoldKey),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeScreenBody({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: "Home",
      ),
      endDrawer: const nav_drawer.NavigationDrawer(),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: ${state.counter}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(IncrementEvent());
                  },
                  child: const Text('Increment'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
