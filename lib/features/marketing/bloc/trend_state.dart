part of 'trend_bloc.dart';

abstract class TrendState extends Equatable {
  const TrendState();

  @override
  List<Object> get props => [];
}

class TrendInitial extends TrendState {
  const TrendInitial();
  @override
  List<Object> get props => [];
}

class TrendLoading extends TrendState {
  const TrendLoading();
  @override
  List<Object> get props => null;
}

class TrendError extends TrendState {
  final String message;
  const TrendError(this.message);
  @override
  List<Object> get props => [message];
}

class TrendOmzetLoaded extends TrendState {
  final List<TrendOmzetModel> data;
  const TrendOmzetLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class TrendOmzetYearLoaded extends TrendState {
  final List<TrendOmzetYearModel> data;
  const TrendOmzetYearLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class TrendMonthLoaded extends TrendState {
  final List<TrendMonthModel> data;
  const TrendMonthLoaded(this.data);
  @override
  List<Object> get props => [data];
}
