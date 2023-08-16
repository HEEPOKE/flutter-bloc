import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false);

  @override
  Stream<bool> mapEventToState(ThemeEvent event) async* {
    if (event == ThemeEvent.toggle) {
      yield !state;
    }
  }
}
