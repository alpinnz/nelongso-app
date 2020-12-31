part of 'investor_bloc.dart';

abstract class InvestorEvent extends Equatable {
  final String year;
  const InvestorEvent({this.year});
  @override
  List<Object> get props => [year];
}

class FetchAll extends InvestorEvent {
  final String year;
  const FetchAll({this.year});
  @override
  List<Object> get props => [year];
}
