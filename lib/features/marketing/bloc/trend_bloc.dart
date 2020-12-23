import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/trend.month.model.dart';
import 'package:nelongso_app/features/marketing/model/trend.omzet.model.dart';
import 'package:nelongso_app/features/marketing/model/trend.omzet.year.model.dart';
import 'package:nelongso_app/features/marketing/repository/marketing.repository.dart';

part 'trend_event.dart';
part 'trend_state.dart';

class TrendBloc extends Bloc<TrendEvent, TrendState> {
  TrendBloc() : super(TrendInitial());

  final MarketingRepository _apiRepository = MarketingRepository();

  @override
  Stream<TrendState> mapEventToState(
    TrendEvent event,
  ) async* {
    if (event is FetchGetTrendOmzet) {
      try {
        yield TrendLoading();
        final data = await _apiRepository.fetchTrendList(
          sheet: event.sheet,
          year: event.year,
        );
        shout('Trend -> Omzet : ', data);
        if (data is String) {
          yield TrendError('Failed to fetch data. is your device online?');
        } else {
          yield TrendOmzetLoaded(data);
        }
      } on NetworkError {
        yield TrendError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetTrendOmzetYear) {
      try {
        yield TrendLoading();
        final data = await _apiRepository.fetchTrendList(
          sheet: event.sheet,
          year: event.year,
        );
        shout('Trend -> Omzet Year : ', data);
        if (data is String) {
          yield TrendError('Failed to fetch data. is your device online?');
        } else {
          yield TrendOmzetYearLoaded(data);
        }
      } on NetworkError {
        yield TrendError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetTrendMonth) {
      try {
        yield TrendLoading();
        final data = await _apiRepository.fetchTrendList(
          sheet: event.sheet,
          year: event.year,
        );
        shout('Trend -> Month : ', data);
        if (data is String) {
          yield TrendError('Failed to fetch data. is your device online?');
        } else {
          yield TrendMonthLoaded(data);
        }
      } on NetworkError {
        yield TrendError("Failed to fetch data. is your device online?");
      }
    }
  }
}
