part of 'noncash_bloc.dart';

abstract class NoncashEvent extends Equatable {
  final String year;
  final String sheet;
  final String month;
  const NoncashEvent({this.year, this.sheet, this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchAllGoresto extends NoncashEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchAllGoresto(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchAllGrabresto extends NoncashEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchAllGrabresto(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchAllGojekandgrab extends NoncashEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchAllGojekandgrab(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchAllSaldograbresto extends NoncashEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchAllSaldograbresto(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchAllSaldogoresto extends NoncashEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchAllSaldogoresto(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}
