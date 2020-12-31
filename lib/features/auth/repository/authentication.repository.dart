import 'dart:convert';

import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/auth/model/account.model.dart';

abstract class AuthenticationRepositoryInterface {
  Future<AccountModel> loadAccountData();

  Future<bool> saveAccountData(AccountModel model);

  Future<bool> deleteAccountData();
}

class AccountRepository extends AuthenticationRepositoryInterface {
  static const String ACCOUNT_DATA_KEY = 'ACCOUNT_DATA_KEY';

  @override
  Future<bool> deleteAccountData() async {
    return await App().sharedPreferences.remove(ACCOUNT_DATA_KEY);
  }

  @override
  Future<AccountModel> loadAccountData() async {
   if (App().sharedPreferences.containsKey(ACCOUNT_DATA_KEY)) {
      final String jsonStr =
          App().sharedPreferences.getString(ACCOUNT_DATA_KEY);
      return AccountModel.fromJson(json.decode(jsonStr));
    }

    return null;
  }

  @override
  Future<bool> saveAccountData(AccountModel model) async {
    return await App()
        .sharedPreferences
        .setString(ACCOUNT_DATA_KEY, json.encode(model.toJson()));
  }
}
