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
import 'package:nelongso_app/features/finance/repository/finance.repository.dart';

part 'allregional_event.dart';
part 'allregional_state.dart';

class AllregionalBloc extends Bloc<AllregionalEvent, AllregionalState> {
  AllregionalBloc() : super(AllregionalInitial());
  final FinanceRepository _apiRepository = FinanceRepository();

  @override
  Stream<AllregionalState> mapEventToState(
    AllregionalEvent event,
  ) async* {
    if (event is FetchAllData) {
      try {
        yield AllregionalLoading();
        final data = await _apiRepository.fetchAllregionalList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalDataLoaded(data);
        }
      } on NetworkError {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllShare) {
      try {
        yield AllregionalLoading();
        final data = await _apiRepository.fetchAllregionalList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalShareLoaded(data);
        }
      } on NetworkError {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllWeak) {
      try {
        yield AllregionalLoading();
        final data = await _apiRepository.fetchAllregionalList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalWeakLoaded(data);
        }
      } on NetworkError {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllBiaya) {
      try {
        yield AllregionalLoading();
        final data = await _apiRepository.fetchAllregionalList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalBiayaLoaded(data);
        }
      } on NetworkError {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllFinal) {
      try {
        yield AllregionalLoading();
        final data = await _apiRepository.fetchAllregionalList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalFinalLoaded(data);
        }
      } on NetworkError {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    } else if (event is FetchAllPph) {
      try {
        yield AllregionalLoading();
        final data = await _apiRepository.fetchAllregionalList(
            sheet: event.sheet, month: event.month, year: event.year);
        shout('Allregional Bloc', data);
        if (data is String) {
          yield AllregionalError(
              'Failed to fetch data. is your device online?');
        } else {
          yield AllregionalPphLoaded(data);
        }
      } on NetworkError {
        yield AllregionalError("Failed to fetch data. is your device online?");
      }
    }
  }
}
