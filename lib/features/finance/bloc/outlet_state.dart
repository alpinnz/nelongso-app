part of 'outlet_bloc.dart';

abstract class OutletState extends Equatable {
  const OutletState();
}

class OutletInitial extends OutletState {
  const OutletInitial();
  @override
  List<Object> get props => [];
}

class OutletLoading extends OutletState {
  const OutletLoading();
  @override
  List<Object> get props => null;
}

class OutletLoaded extends OutletState {
  final List<OutletModel> listOutlet;
  const OutletLoaded(this.listOutlet);
  @override
  List<Object> get props => [listOutlet];
}

class OutletError extends OutletState {
  final String message;
  const OutletError(this.message);
  @override
  List<Object> get props => [message];
}
