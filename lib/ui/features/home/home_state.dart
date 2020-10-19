part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {

  final MessageResponse response;

  HomeLoadedState({@required this.response});

  @override
  List<Object> get props => [response];
}

class HomeFailureState extends HomeState {
  @override
  List<Object> get props => [];
}