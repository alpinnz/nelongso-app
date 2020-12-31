import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/allregional.biaya.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.data.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.final.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.pph.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.share.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.weak.model.dart';
import 'package:nelongso_app/features/finance/provider/allregional.provider.dart';

part 'allregional_event.dart';
part 'allregional_state.dart';

class AllregionalBloc extends Bloc<AllregionalEvent, AllregionalState> {
  AllregionalBloc() : super(AllregionalInitial());
  final AllregionalProvider _apiProvider = AllregionalProvider();

  @override
  Stream<AllregionalState> mapEventToState(
    AllregionalEvent event,
  ) async* {
    if (event is FetchAllData) {
      try {
        yield AllregionalLoading();
        final data = await _apiProvider.fetchList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(data);
        } else if (data == null) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalDataLoaded(data);
        }
      } catch (_) {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllShare) {
      try {
        yield AllregionalLoading();
        final data = await _apiProvider.fetchList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);

        if (data is String) {
          yield AllregionalError(data);
        } else if (data == null) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalShareLoaded(data);
        }
      } catch (_) {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllWeak) {
      try {
        yield AllregionalLoading();
        final data = await _apiProvider.fetchList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);

        if (data is String) {
          yield AllregionalError(data);
        } else if (data == null) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalWeakLoaded(data);
        }
      } catch (_) {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllBiaya) {
      try {
        yield AllregionalLoading();
        final data = await _apiProvider.fetchList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);

        if (data is String) {
          yield AllregionalError(data);
        } else if (data == null) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalBiayaLoaded(data);
        }
      } catch (_) {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllFinal) {
      try {
        yield AllregionalLoading();
        final data = await _apiProvider.fetchList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);

        if (data is String) {
          yield AllregionalError(data);
        } else if (data == null) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalFinalLoaded(data);
        }
      } catch (_) {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllPph) {
      try {
        yield AllregionalLoading();
        final data = await _apiProvider.fetchList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);

        if (data is String) {
          yield AllregionalError(data);
        } else if (data == null) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalPphLoaded(data);
        }
      } catch (_) {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    }
  }
}
