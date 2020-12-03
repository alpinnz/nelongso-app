import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/bisdev/model/investor.model.dart';
import 'package:nelongso_app/features/bisdev/repository/bisdev.repository.dart';

part 'investor_event.dart';
part 'investor_state.dart';

class InvestorBloc extends Bloc<InvestorEvent, InvestorState> {
  InvestorBloc() : super(InvestorInitial());
  final BisdevRepository _apiRepository = BisdevRepository();

  @override
  Stream<InvestorState> mapEventToState(
    InvestorEvent event,
  ) async* {
    if (event is FetchAll) {
      try {
        yield InvestorLoading();
        final data = await _apiRepository.fetchInvestoryList();
        shout('InvestorBloc', data);
        if (data.isNotEmpty || !data is String) {
          yield InvestorLoaded(data);
        } else {
          yield InvestorError('Failed to fetch data. is your device online?');
        }
      } on NetworkError {
        yield InvestorError("Failed to fetch data. is your device online?");
      }
    }
  }
}
