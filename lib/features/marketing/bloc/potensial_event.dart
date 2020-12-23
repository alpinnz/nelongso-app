part of 'potensial_bloc.dart';

abstract class PotensialEvent extends Equatable {
  final String year;
  final String sheet;
  final String month;
  const PotensialEvent({this.year, this.sheet, this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetRegional extends PotensialEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetRegional(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}
