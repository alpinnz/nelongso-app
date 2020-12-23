import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/lose.menu.dart';
import 'package:nelongso_app/features/marketing/model/lose.outlet.model.dart';
import 'package:nelongso_app/features/marketing/model/lose.rekap.model.dart';
import 'package:nelongso_app/features/marketing/repository/marketing.repository.dart';

part 'lose_event.dart';
part 'lose_state.dart';

class LoseBloc extends Bloc<LoseEvent, LoseState> {
  LoseBloc() : super(LoseInitial());

  final MarketingRepository _apiRepository = MarketingRepository();

  @override
  Stream<LoseState> mapEventToState(
    LoseEvent event,
  ) async* {
    if (event is FetchGetRekap) {
      try {
        yield LoseLoading();
        final data = await _apiRepository.fetchLoseList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Lose -> Relap Bloc', data);
        if (data is String) {
          yield LoseError('Failed to fetch data. is your device online?');
        } else {
          yield LoseRekapLoaded(data);
        }
      } on NetworkError {
        yield LoseError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetOutlet) {
      try {
        yield LoseLoading();
        final data = await _apiRepository.fetchLoseList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Lose -> Outlet Bloc', data);
        if (data is String) {
          yield LoseError('Failed to fetch data. is your device online?');
        } else {
          yield LoseOutletLoaded(data);
        }
      } on NetworkError {
        yield LoseError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetMenu) {
      try {
        yield LoseLoading();
        final data = await _apiRepository.fetchLoseList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Lose -> Menu Bloc', data);
        if (data is String) {
          yield LoseError('Failed to fetch data. is your device online?');
        } else {
          yield LoseMenuLoaded(data);
        }
      } on NetworkError {
        yield LoseError("Failed to fetch data. is your device online?");
      }
    }
  }
}
