import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/outlet.model.dart';
import 'package:nelongso_app/features/finance/provider/outlet.provider.dart';

part 'outlet_event.dart';
part 'outlet_state.dart';

class OutletBloc extends Bloc<OutletEvent, OutletState> {
  OutletBloc() : super(OutletInitial());
  final OutletProvider _apiProvider = OutletProvider();

  @override
  Stream<OutletState> mapEventToState(
    OutletEvent event,
  ) async* {
    if (event is FetchAll) {
      try {
        yield OutletLoading();
        final data = await _apiProvider.fetchList(year: event.year);
        shout('OutletBloc', data);

        if (data is String) {
          yield OutletError(data);
        } else if (data == null) {
          yield OutletError('Failed to fetch data. is your device online?');
        } else {
          yield OutletLoaded(data);
        }
      } catch (_) {
        yield OutletError("Failed to fetch data. is your device online?");
      }
    }
  }
}
