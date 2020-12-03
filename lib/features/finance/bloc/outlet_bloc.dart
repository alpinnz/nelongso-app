import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/outlet.model.dart';
import 'package:nelongso_app/features/finance/repository/finance.repository.dart';

part 'outlet_event.dart';
part 'outlet_state.dart';

class OutletBloc extends Bloc<OutletEvent, OutletState> {
  OutletBloc() : super(OutletInitial());
  final FinanceRepository _apiRepository = FinanceRepository();

  @override
  Stream<OutletState> mapEventToState(
    OutletEvent event,
  ) async* {
    if (event is FetchAll) {
      try {
        yield OutletLoading();
        final data = await _apiRepository.fetchOutletList();
        shout('OutletBloc', data);
        if (data.isNotEmpty || !data is String) {
          yield OutletLoaded(data);
        } else {
          yield OutletError('Failed to fetch data. is your device online?');
        }
      } on NetworkError {
        yield OutletError("Failed to fetch data. is your device online?");
      }
    }
  }
}
