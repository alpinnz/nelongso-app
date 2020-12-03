part of 'investor_bloc.dart';

abstract class InvestorEvent extends Equatable {
  const InvestorEvent();
}

class FetchAll extends InvestorEvent {
  const FetchAll();
  @override
  List<Object> get props => null;
}
