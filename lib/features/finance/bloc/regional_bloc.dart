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
import 'package:nelongso_app/features/finance/provider/regional.provider.dart';

part 'regional_event.dart';
part 'regional_state.dart';

class RegionalBloc extends Bloc<RegionalEvent, RegionalState> {
  RegionalBloc() : super(RegionalInitial());
  final RegionalProvider _apiProvider = RegionalProvider();

  @override
  Stream<RegionalState> mapEventToState(
    RegionalEvent event,
  ) async* {
    if (event is FetchAllOutlet) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOutletLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllMenu) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);
        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalMenuLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllKunjungan) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);

        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalKunjunganLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllPersentasekunjungan) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);

        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalPersentasekunjunganLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllOmzetofflineandonline) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);

        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOmzetofflineandonlineLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllOmzetpershift) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);

        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOmzetpershiftLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllOperasional) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);

        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalOperasionalLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllHpp) {
      try {
        yield RegionalLoading();
        final data = await _apiProvider.fetchList(
            regional: event.regional,
            sheet: event.sheet,
            month: event.month,
            year: event.year);
        shout('Regional Bloc', data);

        if (data is String) {
          yield RegionalError(data);
        } else if (data == null) {
          yield RegionalError('Failed to fetch data. is your device online?');
        } else {
          yield RegionalHppLoaded(data);
        }
      } catch (_) {
        yield RegionalError("Failed to fetch data. is your device online?");
      }
    }
  }
}
