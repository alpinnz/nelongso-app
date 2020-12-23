part of 'ketercapaian_bloc.dart';

abstract class KetercapaianEvent extends Equatable {
  final String year;
  final String sheet;
  final String month;
  const KetercapaianEvent({this.year, this.sheet, this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetOmzet extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetOmzet(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetRegional extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetRegional(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetKunjungan extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetKunjungan(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetBasket extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetBasket(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetAllregional extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetAllregional(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetSelisih extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetSelisih(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}

class FetchGetOutlet extends KetercapaianEvent {
  final String year;
  final String sheet;
  final String month;
  const FetchGetOutlet(
      {@required this.year, @required this.sheet, @required this.month});
  @override
  List<Object> get props => [year, sheet, month];
}
