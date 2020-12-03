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
import 'package:nelongso_app/features/finance/repository/finance.repository.dart';

part 'noncash_event.dart';
part 'noncash_state.dart';

class NoncashBloc extends Bloc<NoncashEvent, NoncashState> {
  NoncashBloc() : super(NoncashInitial());
  final FinanceRepository _apiRepository = FinanceRepository();

  @override
  Stream<NoncashState> mapEventToState(
    NoncashEvent event,
  ) async* {
    print("event here's the NoncashBloc");
    print("event here's the sheet : ${event.sheet}");
    print("event here's the year : ${event.year}");
    print("event here's the month : ${event.month}");
    if (event is FetchAllGoresto) {
      try {
        yield NoncashLoading();
        final data = await _apiRepository.fetchNoncashList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String || data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashGorestoLoaded(data);
        }
      } on NetworkError {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllGrabresto) {
      try {
        yield NoncashLoading();
        final data = await _apiRepository.fetchNoncashList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String || data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashGrabrestoLoaded(data);
        }
      } on NetworkError {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllGojekandgrab) {
      try {
        yield NoncashLoading();
        final data = await _apiRepository.fetchNoncashList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String || data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashGojekandgrabLoaded(data);
        }
      } on NetworkError {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllSaldograbresto) {
      try {
        yield NoncashLoading();
        final data = await _apiRepository.fetchNoncashList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String || data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashSaldograbrestoLoaded(data);
        }
      } on NetworkError {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllSaldogoresto) {
      try {
        yield NoncashLoading();
        final data = await _apiRepository.fetchNoncashList(
          sheet: event.sheet,
          year: event.year,
          month: event.month,
        );
        shout('NoncashBloc', data);
        if (data is String || data == null) {
          yield NoncashError('Failed to fetch data. is your device online?');
        } else {
          yield NoncashSaldogorestoLoaded(data);
        }
      } on NetworkError {
        yield NoncashError("Failed to fetch data. is your device online?");
      }
    }
  }
}
