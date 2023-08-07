import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeEvent {}

class HomeState {
  final int counter;

  HomeState(this.counter);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(0));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is IncrementEvent) {
      yield HomeState(state.counter + 1);
    }
  }
}

class IncrementEvent extends HomeEvent {}
