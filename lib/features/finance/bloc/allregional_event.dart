part of 'allregional_bloc.dart';

abstract class AllregionalEvent extends Equatable {
  final String year;
  final String month;
  final String sheet;
  const AllregionalEvent({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllData extends AllregionalEvent {
  final String year;
  final String month;
  final String sheet;
  const FetchAllData({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllShare extends AllregionalEvent {
  final String year;
  final String month;
  final String sheet;
  const FetchAllShare({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllWeak extends AllregionalEvent {
  final String year;
  final String month;
  final String sheet;
  const FetchAllWeak({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllBiaya extends AllregionalEvent {
  final String year;
  final String month;
  final String sheet;
  const FetchAllBiaya({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllFinal extends AllregionalEvent {
  final String year;
  final String month;
  final String sheet;
  const FetchAllFinal({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}

class FetchAllPph extends AllregionalEvent {
  final String year;
  final String month;
  final String sheet;
  const FetchAllPph({this.year, this.month, this.sheet});
  @override
  List<Object> get props => [year, month, sheet];
}
