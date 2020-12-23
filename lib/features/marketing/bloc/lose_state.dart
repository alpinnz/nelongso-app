part of 'lose_bloc.dart';

abstract class LoseState extends Equatable {
  const LoseState();

  @override
  List<Object> get props => [];
}

class LoseInitial extends LoseState {
  const LoseInitial();
  @override
  List<Object> get props => [];
}

class LoseLoading extends LoseState {
  const LoseLoading();
  @override
  List<Object> get props => null;
}

class LoseError extends LoseState {
  final String message;
  const LoseError(this.message);
  @override
  List<Object> get props => [message];
}

class LoseRekapLoaded extends LoseState {
  final List<LoseRekapModel> data;
  const LoseRekapLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class LoseOutletLoaded extends LoseState {
  final List<LoseOutletModel> data;
  const LoseOutletLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class LoseMenuLoaded extends LoseState {
  final List<LoseMenuModel> data;
  const LoseMenuLoaded(this.data);
  @override
  List<Object> get props => [data];
}
