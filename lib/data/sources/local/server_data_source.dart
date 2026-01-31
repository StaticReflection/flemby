import 'dart:convert';

import 'package:flemby/core/extensions/shared_preferences_extension.dart';
import 'package:flemby/data/models/emby_server_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ServerLocalDataSource {
  List<EmbyServerModel> getServerList();
  Future<void> saveServerList(List<EmbyServerModel> servers);
  EmbyServerModel? getSelectedServer();
  Future<void> saveSelectedServer(EmbyServerModel? server);
  Future<void> removeSelectedServer();
}

class ServerLocalDataSourceImpl implements ServerLocalDataSource {
  final SharedPreferences _sharedPreferences;
  static const _listKey = 'emby_servers_list';
  static const _selectedKey = 'selected_server_id';

  ServerLocalDataSourceImpl(this._sharedPreferences);

  @override
  List<EmbyServerModel> getServerList() {
    return _sharedPreferences.getModelList(_listKey, EmbyServerModel.fromJson);
  }

  @override
  Future<void> saveServerList(List<EmbyServerModel> servers) async {
    await _sharedPreferences.setModelList(_listKey, servers);
  }

  @override
  EmbyServerModel? getSelectedServer() {
    final jsonStr = _sharedPreferences.getString(_selectedKey);
    if (jsonStr == null) return null;
    try {
      return EmbyServerModel.fromJson(jsonDecode(jsonStr));
    } catch (e) {
      _sharedPreferences.remove(_selectedKey);
      return null;
    }
  }

  @override
  Future<void> saveSelectedServer(EmbyServerModel? server) async {
    await _sharedPreferences.setString(
      _selectedKey,
      jsonEncode(server?.toJson()),
    );
  }

  @override
  Future<void> removeSelectedServer() async {
    await _sharedPreferences.remove(_selectedKey);
  }
}
