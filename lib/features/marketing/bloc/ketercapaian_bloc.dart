import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.allregional.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.basket.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.kunjungan.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.omzet.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.outlet.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.regional.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.selisih.model.dart';
import 'package:nelongso_app/features/marketing/provider/ketercapaian.provider.dart';

part 'ketercapaian_event.dart';
part 'ketercapaian_state.dart';

class KetercapaianBloc extends Bloc<KetercapaianEvent, KetercapaianState> {
  KetercapaianBloc() : super(KetercapaianInitial());

  final KetercapaianProvider _apiProvider = KetercapaianProvider();

  @override
  Stream<KetercapaianState> mapEventToState(
    KetercapaianEvent event,
  ) async* {
    if (event is FetchGetAllregional) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian -> all regional Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianAllregionalLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetRegional) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian -> Regional Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianRegionalLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetOmzet) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian->Omzet Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianOmzetLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetOutlet) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian->Outlet Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianOutletLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetSelisih) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian->Selisih Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianSelisihLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetBasket) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian->Basket Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianBasketLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchGetKunjungan) {
      try {
        yield KetercapaianLoading();
        final data = await _apiProvider.fetchList(
          sheet: event.sheet,
          month: event.month,
          year: event.year,
        );
        shout('Ketercapaian->Kunjungan Bloc', data);

        if (data is String) {
          yield KetercapaianError(data);
        } else if (data == null) {
          yield KetercapaianError(
              'Failed to fetch data. is your device online?');
        } else {
          yield KetercapaianKunjunganLoaded(data);
        }
      } catch (_) {
        yield KetercapaianError("Failed to fetch data. is your device online?");
      }
    }
  }
}
