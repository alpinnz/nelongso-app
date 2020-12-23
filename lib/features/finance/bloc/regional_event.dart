part of 'regional_bloc.dart';

abstract class RegionalEvent extends Equatable {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const RegionalEvent({this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllOutlet extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllOutlet({this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllMenu extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllMenu({this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllHpp extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllHpp({this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllOperasional extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllOperasional({this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllPersentasekunjungan extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllPersentasekunjungan(
      {this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllKunjungan extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllKunjungan({this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllOmzetofflineandonline extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllOmzetofflineandonline(
      {this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllOmzetpershift extends RegionalEvent {
  final String regional;
  final String year;
  final String month;
  final String sheet;
  const FetchAllOmzetpershift(
      {this.regional, this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}
