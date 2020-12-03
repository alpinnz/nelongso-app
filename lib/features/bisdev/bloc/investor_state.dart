part of 'investor_bloc.dart';

@immutable
abstract class InvestorState extends Equatable {
  const InvestorState();
}

class InvestorInitial extends InvestorState {
  const InvestorInitial();
  @override
  List<Object> get props => [];
}

class InvestorLoading extends InvestorState {
  const InvestorLoading();
  @override
  List<Object> get props => null;
}

class InvestorLoaded extends InvestorState {
  final List<InvestorModel> listInvestor;
  const InvestorLoaded(this.listInvestor);
  @override
  List<Object> get props => [listInvestor];
}

class InvestorError extends InvestorState {
  final String message;
  const InvestorError(this.message);
  @override
  List<Object> get props => [message];
}
