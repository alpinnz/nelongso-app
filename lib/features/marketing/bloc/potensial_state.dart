part of 'potensial_bloc.dart';

abstract class PotensialState extends Equatable {
  const PotensialState();

  @override
  List<Object> get props => [];
}

class PotensialInitial extends PotensialState {
  const PotensialInitial();
  @override
  List<Object> get props => [];
}

class PotensialLoading extends PotensialState {
  const PotensialLoading();
  @override
  List<Object> get props => null;
}

class PotensialError extends PotensialState {
  final String message;
  const PotensialError(this.message);
  @override
  List<Object> get props => [message];
}

class PotensialRegionalLoaded extends PotensialState {
  final List<PotensialRegionalModel> data;
  const PotensialRegionalLoaded(this.data);
  @override
  List<Object> get props => [data];
}
