import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesExtension on SharedPreferences {
  Future<bool> setModelList<T>(String key, List<T> modelList) async {
    final List<String> jsonStringList = modelList.map((model) {
      return jsonEncode((model as dynamic).toJson());
    }).toList();

    return await setStringList(key, jsonStringList);
  }

  List<T> getModelList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final List<String>? jsonStringList = getStringList(key);

    if (jsonStringList == null || jsonStringList.isEmpty) {
      return [];
    }

    return jsonStringList.map((jsonString) {
      final Map<String, dynamic> map = jsonDecode(jsonString);
      return fromJson(map);
    }).toList();
  }
}
