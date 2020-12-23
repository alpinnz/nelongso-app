import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/potensial.regional.model.dart';
import 'package:nelongso_app/features/marketing/repository/marketing.repository.dart';

part 'potensial_event.dart';
part 'potensial_state.dart';

class PotensialBloc extends Bloc<PotensialEvent, PotensialState> {
  PotensialBloc() : super(PotensialInitial());
  final MarketingRepository _apiRepository = MarketingRepository();
  @override
  Stream<PotensialState> mapEventToState(
    PotensialEvent event,
  ) async* {
    if (event is FetchGetRegional) {
      try {
        yield PotensialLoading();
        final data = await _apiRepository.fetchPotensialList(
          sheet: event.sheet,
          year: event.year,
        );
        shout('Potensial -> Regional : ', data);
        if (data is String) {
          yield PotensialError('Failed to fetch data. is your device online?');
        } else {
          yield PotensialRegionalLoaded(data);
        }
      } on NetworkError {
        yield PotensialError("Failed to fetch data. is your device online?");
      }
    }
  }
}
