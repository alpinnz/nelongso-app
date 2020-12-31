import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/noncash.gojekandgrab.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.goresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.grabresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.saldogoresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.saldograbresto.model.dart';
import 'package:nelongso_app/features/finance/provider/noncash.provider.dart';

part 'noncash_event.dart';
part 'noncash_state.dart';

class NoncashBloc extends Bloc<NoncashEvent, NoncashState> {
  NoncashBloc() : super(NoncashInitial());
  final NoncashProvider _apiProvider = NoncashProvider();

  @override
  Stream<NoncashState> mapEventToState(
    NoncashEvent event,
  ) async* {
    if (event is FetchAllGoresto) {
      try {
        yield NoncashLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String) {
          yield NoncashError(data);
        } else if (data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashGorestoLoaded(data);
        }
      } catch (_) {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllGrabresto) {
      try {
        yield NoncashLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String) {
          yield NoncashError(data);
        } else if (data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashGrabrestoLoaded(data);
        }
      } catch (_) {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllGojekandgrab) {
      try {
        yield NoncashLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);

        if (data is String) {
          yield NoncashError(data);
        } else if (data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashGojekandgrabLoaded(data);
        }
      } catch (_) {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllSaldograbresto) {
      try {
        yield NoncashLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);

        if (data is String) {
          yield NoncashError(data);
        } else if (data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashSaldograbrestoLoaded(data);
        }
      } catch (_) {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllSaldogoresto) {
      try {
        yield NoncashLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);

        if (data is String) {
          yield NoncashError(data);
        } else if (data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashSaldogorestoLoaded(data);
        }
      } catch (_) {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    }
  }
}
