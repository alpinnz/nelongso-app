part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadEvent extends HomeEvent {
  const LoadEvent();
  @override
  List<Object> get props => [];
}