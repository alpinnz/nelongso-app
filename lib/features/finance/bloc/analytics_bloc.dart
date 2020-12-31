import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/analytics.month.model.dart';
import 'package:nelongso_app/features/finance/model/analytics.target.model.dart';
import 'package:nelongso_app/features/finance/provider/analytics.provider.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial());
  final AnalyticsProvider _apiProvider = AnalyticsProvider();

  @override
  Stream<AnalyticsState> mapEventToState(
    AnalyticsEvent event,
  ) async* {
    if (event is FetchAllTarget) {
      try {
        yield AnalyticsLoading();
        final data =
            await _apiProvider.fetchList(sheet: event.sheet, year: event.year);
        shout('AnalyticsBloc', data);
        if (data is String) {
          yield AnalyticsError(data);
        } else if (data == null) {
          yield AnalyticsError('Failed to fetch data. is your device online?');
        } else {
          yield AnalyticsTargetLoaded(data);
        }
      } catch (_) {
        yield AnalyticsError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllMonth) {
      try {
        yield AnalyticsLoading();
        final data =
            await _apiProvider.fetchList(sheet: event.sheet, year: event.year);
        shout('AnalyticsBloc', data);

        if (data is String) {
          yield AnalyticsError(data);
        } else if (data == null) {
          yield AnalyticsError('Failed to fetch data. is your device online?');
        } else {
          yield AnalyticsMonthLoaded(data);
        }
      } catch (_) {
        yield AnalyticsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
