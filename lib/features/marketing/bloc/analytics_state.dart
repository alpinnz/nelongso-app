part of 'analytics_bloc.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object> get props => [];
}

class AnalyticsInitial extends AnalyticsState {
  const AnalyticsInitial();
  @override
  List<Object> get props => [];
}

class AnalyticsLoading extends AnalyticsState {
  const AnalyticsLoading();
  @override
  List<Object> get props => null;
}

class AnalyticsError extends AnalyticsState {
  final String message;
  const AnalyticsError(this.message);
  @override
  List<Object> get props => [message];
}

class AnalyticsLoaded extends AnalyticsState {
  final List<AnalyticsModel> data;
  const AnalyticsLoaded(this.data);
  @override
  List<Object> get props => [data];
}
