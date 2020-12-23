import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/analytics.model.dart';
import 'package:nelongso_app/features/marketing/repository/marketing.repository.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial());
  final MarketingRepository _apiRepository = MarketingRepository();
  @override
  Stream<AnalyticsState> mapEventToState(
    AnalyticsEvent event,
  ) async* {
    if (event is FetchGet) {
      try {
        yield AnalyticsLoading();
        final data = await _apiRepository.fetchAnalyticsList(
          sheet: event.sheet,
          year: event.year,
        );
        shout('Ketercapaian -> all regional Bloc', data);
        if (data is String) {
          yield AnalyticsError('Failed to fetch data. is your device online?');
        } else {
          yield AnalyticsLoaded(data);
        }
      } on NetworkError {
        yield AnalyticsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
