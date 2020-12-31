import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/auth/model/account.model.dart';
import 'package:nelongso_app/features/auth/provider/authentication.provider.dart';
import 'package:nelongso_app/features/auth/repository/authentication.repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  final AuthenticationProvider _apiProvider = AuthenticationProvider();
  AuthenticationRepositoryInterface _accountRepository = AccountRepository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEvent) {
      try {
        yield LoginLoading();
        String email = event.email;
        String password = event.password;
        final data = await _apiProvider.onLogin(email: email, password: password);
        shout('onLoginBloc', data);
        if (data is String) {
          yield LoginError(data);
        } else if (data == null) {
          yield LoginError('error');
        } else {
          await _accountRepository.saveAccountData(data);
          yield LoginLoaded(data);
        }
      } on NetworkError {
        yield LoginError("Failed to fetch data. is your device online?");
      }
    }
  }
}
