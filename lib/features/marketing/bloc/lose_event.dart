part of 'lose_bloc.dart';

abstract class LoseEvent extends Equatable {
  final String year;
  final String sheet;
  final String month;
  const LoseEvent({this.year, this.sheet, this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetRekap extends LoseEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetRekap(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetOutlet extends LoseEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetOutlet(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetMenu extends LoseEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetMenu(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}
