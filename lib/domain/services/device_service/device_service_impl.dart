import 'package:device_info_plus/device_info_plus.dart';
import 'package:flemby/domain/services/device_service/device_service.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceServiceImpl implements DeviceService {
  final DeviceInfoPlugin _deviceInfo;
  final SharedPreferences _prefs;

  DeviceServiceImpl(this._deviceInfo, this._prefs);

  static const String _deviceIdKey = 'cached_device_id';

  String? _cachedDeviceName;
  String? _cachedAppVersion;

  @override
  Future<String> getDeviceId() async {
    String? id = _prefs.getString(_deviceIdKey);
    if (id == null) {
      id = const Uuid().v4();
      await _prefs.setString(_deviceIdKey, id);
    }
    return id;
  }

  @override
  Future<String> getDeviceName() async {
    if (_cachedDeviceName != null) return _cachedDeviceName!;

    _cachedDeviceName = await switch (defaultTargetPlatform) {
      TargetPlatform.android => _deviceInfo.androidInfo.then(
        (info) => "${info.brand} ${info.model}",
      ),
      TargetPlatform.iOS => _deviceInfo.iosInfo.then((info) => info.name),
      TargetPlatform.macOS => _deviceInfo.macOsInfo.then(
        (info) => info.computerName,
      ),
      TargetPlatform.windows => _deviceInfo.windowsInfo.then(
        (info) => info.computerName,
      ),
      TargetPlatform.linux => _deviceInfo.linuxInfo.then((info) => info.name),
      _ => Future.value("Flemby Client"),
    };

    return _cachedDeviceName!;
  }

  @override
  Future<String> getAppVersion() async {
    if (_cachedAppVersion != null) return _cachedAppVersion!;

    final packageInfo = await PackageInfo.fromPlatform();
    _cachedAppVersion = packageInfo.version;
    return _cachedAppVersion!;
  }
}
