part of 'outlet_bloc.dart';

abstract class OutletEvent extends Equatable {
  final String year;
  const OutletEvent({this.year});
  @override
  List<Object> get props => [year];
}

class FetchAll extends OutletEvent {
  final String year;
  const FetchAll({this.year});
  @override
  List<Object> get props => [year];
}
