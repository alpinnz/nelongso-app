part of 'analytics_bloc.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();
}

class AnalyticsInitial extends AnalyticsState {
  @override
  List<Object> get props => [];
}

class AnalyticsLoading extends AnalyticsState {
  const AnalyticsLoading();
  @override
  List<Object> get props => null;
}

class AnalyticsTargetLoaded extends AnalyticsState {
  final List<AnalyticsTargetModel> listAnalyticsTarget;
  const AnalyticsTargetLoaded(this.listAnalyticsTarget);
  @override
  List<Object> get props => [listAnalyticsTarget];
}

class AnalyticsMonthLoaded extends AnalyticsState {
  final List<AnalyticsMonthModel> listAnalyticsMonth;
  const AnalyticsMonthLoaded(this.listAnalyticsMonth);
  @override
  List<Object> get props => [listAnalyticsMonth];
}

class AnalyticsError extends AnalyticsState {
  final String message;
  const AnalyticsError(this.message);
  @override
  List<Object> get props => [message];
}
