part of 'analytics_bloc.dart';

abstract class AnalyticsEvent extends Equatable {
  final String year;
  final String sheet;
  const AnalyticsEvent({this.year, this.sheet});
  @override
  List<Object> get props => [year, sheet];
}

class FetchGet extends AnalyticsEvent {
  final String year;
  final String sheet;
  const FetchGet({@required this.year, @required this.sheet});
  @override
  List<Object> get props => [year, sheet];
}
