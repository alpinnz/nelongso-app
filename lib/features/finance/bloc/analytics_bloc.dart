import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/analytics.month.model.dart';
import 'package:nelongso_app/features/finance/model/analytics.target.model.dart';
import 'package:nelongso_app/features/finance/repository/finance.repository.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial());
  final FinanceRepository _apiRepository = FinanceRepository();

  @override
  Stream<AnalyticsState> mapEventToState(
    AnalyticsEvent event,
  ) async* {
    print("event here's the AnalyticsBloc");
    print("event here's the sheet : ${event.sheet}");
    print("event here's the year : ${event.year}");
    if (event is FetchAllTarget) {
      try {
        yield AnalyticsLoading();
        final data = await _apiRepository.fetchAnalyticsList(
            sheet: event.sheet, year: event.year);
        shout('AnalyticsBloc', data);
        if (data is String) {
          yield AnalyticsError('Failed to fetch data. is your device online?');
        } else {
          yield AnalyticsTargetLoaded(data);
        }
      } on NetworkError {
        yield AnalyticsError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllMonth) {
      try {
        yield AnalyticsLoading();
        final data = await _apiRepository.fetchAnalyticsList(
            sheet: event.sheet, year: event.year);
        shout('AnalyticsBloc', data);
        if (data.isNotEmpty || !data is String) {
          yield AnalyticsMonthLoaded(data);
        } else {
          yield AnalyticsError('Failed to fetch data. is your device online?');
        }
      } on NetworkError {
        yield AnalyticsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
