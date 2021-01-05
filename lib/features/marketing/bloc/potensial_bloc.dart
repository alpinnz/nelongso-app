import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/potensial.regional.model.dart';
import 'package:nelongso_app/features/marketing/provider/potensial.provider.dart';

part 'potensial_event.dart';
part 'potensial_state.dart';

class PotensialBloc extends Bloc<PotensialEvent, PotensialState> {
  PotensialBloc() : super(PotensialInitial());
  final PotensialProvider _apiProvider = PotensialProvider();
  @override
  Stream<PotensialState> mapEventToState(
    PotensialEvent event,
  ) async* {
    if (event is FetchGetRegional) {
      try {
        yield PotensialLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('Potensial -> Regional : ', data);

        if (data is String) {
          yield PotensialError(data);
        } else if (data == null) {
          yield PotensialError('Failed to fetch data. is your device online?');
        } else {
          yield PotensialRegionalLoaded(data);
        }
      } catch (e) {
        shout('error : ', e.toString());
        yield PotensialError("Failed to fetch data. is your device online?");
      }
    }
  }
}
