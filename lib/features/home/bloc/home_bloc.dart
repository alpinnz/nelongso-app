import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/auth/model/account.model.dart';
import 'package:nelongso_app/features/auth/repository/authentication.repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  AuthenticationRepositoryInterface _accountRepository = AccountRepository();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadEvent) {
      try {
        yield HomeLoading();
        AccountModel data = await _accountRepository.loadAccountData();
        shout('onHomeBloc', data);
        String role = data.role.toLowerCase();

        if (role == 'admin') {
          yield HomeAdmin(data);
        } else if (role == 'owner') {
          yield HomeOwner(data);
        } else if (role == 'co-finance') {
          yield HomeCOFinance(data);
        } else if (role == 'co-operasional') {
          yield HomeCOOperasional(data);
        } else if (role == 'co-bisdev') {
          yield HomeCOBisdev(data);
        } else if (role == 'co-marketing') {
          yield HomeCOMarketing(data);
        } else if (role == 'co-produksi') {
          yield HomeCOProduksi(data);
        } else if (role == 'co-hrd') {
          yield HomeCOHrd(data);
        } else if (role == 'user') {
          yield HomeUser(data);
        } else {
          yield HomeError('failed role');
        }
      } catch (e) {
        yield HomeError(e.toString());
      }
    }
  }
}
