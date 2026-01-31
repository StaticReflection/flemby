import 'dart:convert';

import 'package:flemby/core/extensions/shared_preferences_extension.dart';
import 'package:flemby/data/models/emby_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AccountLocalDataSource {
  Future<void> saveEmbyAccount(String serverId, EmbyAccountModel account);

  List<EmbyAccountModel> getEmbyAccountList(String serverId);

  Future<void> removeEmbyAccount(String serverId, EmbyAccountModel account);

  Future<void> updateEmbyAccount(String serverId, EmbyAccountModel account);

  Future<void> saveSelectedEmbyAccount({
    required String serverId,
    required EmbyAccountModel? account,
  });

  Future<EmbyAccountModel?> getSelectedEmbyAccount(String serverId);

  Future<void> removeSelectedEmbyAccount(String serverId);
}

class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  final SharedPreferences _sharedPreferences;
  AccountLocalDataSourceImpl(this._sharedPreferences);

  String _generateKey(String serverId) => 'accounts_$serverId';
  String _generateSelectedKey(String serverId) => 'selected_account_$serverId';

  @override
  List<EmbyAccountModel> getEmbyAccountList(String serverId) {
    return _sharedPreferences.getModelList(
      _generateKey(serverId),
      EmbyAccountModel.fromJson,
    );
  }

  @override
  Future<void> saveEmbyAccount(
    String serverId,
    EmbyAccountModel account,
  ) async {
    final List<EmbyAccountModel> accountList = getEmbyAccountList(serverId);
    final index = accountList.indexWhere((i) => i.id == account.id);

    if (index >= 0) {
      accountList[index] = account;
    } else {
      accountList.add(account);
    }
    await _sharedPreferences.setModelList(_generateKey(serverId), accountList);
  }

  @override
  Future<void> removeEmbyAccount(
    String serverId,
    EmbyAccountModel account,
  ) async {
    final List<EmbyAccountModel> accountList = getEmbyAccountList(serverId);
    accountList.removeWhere((i) => i.id == account.id);
    await _sharedPreferences.setModelList(_generateKey(serverId), accountList);
  }

  @override
  Future<void> updateEmbyAccount(
    String serverId,
    EmbyAccountModel account,
  ) async => saveEmbyAccount(serverId, account);

  @override
  Future<EmbyAccountModel?> getSelectedEmbyAccount(String serverId) async {
    final key = _generateSelectedKey(serverId);
    final jsonString = _sharedPreferences.getString(key);
    if (jsonString == null) return null;
    try {
      return EmbyAccountModel.fromJson(jsonDecode(jsonString));
    } catch (e) {
      await _sharedPreferences.remove(key);
      return null;
    }
  }

  @override
  Future<void> saveSelectedEmbyAccount({
    required String serverId,
    required EmbyAccountModel? account,
  }) async {
    await _sharedPreferences.setString(
      _generateSelectedKey(serverId),
      jsonEncode(account?.toJson()),
    );
  }

  @override
  Future<void> removeSelectedEmbyAccount(String serverId) async {
    await _sharedPreferences.remove(_generateSelectedKey(serverId));
  }
}
