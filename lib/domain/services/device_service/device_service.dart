abstract class DeviceService {
  Future<String> getDeviceName();
  Future<String> getDeviceId();
  Future<String> getAppVersion();
}
