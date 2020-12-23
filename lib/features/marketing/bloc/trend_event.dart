part of 'trend_bloc.dart';

abstract class TrendEvent extends Equatable {
  final String year;
  final String sheet;

  const TrendEvent({this.year, this.sheet});
  @override
  List<Object> get props => [year, sheet];
}

class FetchGetTrendOmzet extends TrendEvent {
  final String year;
  final String sheet;
  const FetchGetTrendOmzet({@required this.year, @required this.sheet});
  @override
  List<Object> get props => [year, sheet];
}

class FetchGetTrendOmzetYear extends TrendEvent {
  final String year;
  final String sheet;
  const FetchGetTrendOmzetYear({@required this.year, @required this.sheet});
  @override
  List<Object> get props => [year, sheet];
}

class FetchGetTrendMonth extends TrendEvent {
  final String year;
  final String sheet;
  const FetchGetTrendMonth({@required this.year, @required this.sheet});
  @override
  List<Object> get props => [year, sheet];
}
