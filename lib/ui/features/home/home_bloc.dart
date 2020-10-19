import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/data/models/message_response.dart';
import 'package:hello_world/data/repositories/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final Repository repository;

  HomeBloc({@required this.repository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try{
      yield HomeLoadingState();
      final response = await repository.getMessage();
      yield HomeLoadedState(response: response);
    }on Exception {
      yield HomeFailureState();
    }
  }
}
