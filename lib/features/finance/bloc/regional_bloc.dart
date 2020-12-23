import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/regional.hpp.model.dart';
import 'package:nelongso_app/features/finance/model/regional.kunjungan.model.dart';
import 'package:nelongso_app/features/finance/model/regional.menu.model.dart';
import 'package:nelongso_app/features/finance/model/regional.omzetofflineandonline.model.dart';
import 'package:nelongso_app/features/finance/model/regional.omzetpershift.model.dart';
import 'package:nelongso_app/features/finance/model/regional.operasional.model.dart';
import 'package:nelongso_app/features/finance/model/regional.outlet.model.dart';
import 'package:nelongso_app/features/finance/model/regional.persentasekunjungan.model.dart';
import 'package:nelongso_app/features/finance/repository/finance.repository.dart';

part 'regional_event.dart';
part 'regional_state.dart';

class RegionalBloc extends Bloc<RegionalEvent, RegionalState> {
  RegionalBloc() : super(RegionalInitial());
  final FinanceRepository _apiRepository = FinanceRepository();

  @override
  Stream<RegionalState> mapEventToState(
    RegionalEvent event,
  ) async* {
    if (event is FetchAllOutlet) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOutletLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllMenu) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalMenuLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllKunjungan) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalKunjunganLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllPersentasekunjungan) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalPersentasekunjunganLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllOmzetofflineandonline) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOmzetofflineandonlineLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllOmzetpershift) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOmzetpershiftLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllOperasional) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOperasionalLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllHpp) {
      try {
        yield RegionalLoading();
        final data = await _apiRepository.fetchRegionalList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalHppLoaded(data);
        }
      } on NetworkError {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    }
  }
}
