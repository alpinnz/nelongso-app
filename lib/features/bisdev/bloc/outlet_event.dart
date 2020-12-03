part of 'outlet_bloc.dart';

abstract class OutletEvent extends Equatable {
  const OutletEvent();
}

class FetchAll extends OutletEvent {
  const FetchAll();
  @override
  List<Object> get props => null;
}
