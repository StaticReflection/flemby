import 'package:dio/dio.dart';
import 'package:flemby/core/exceptions/emby_exception.dart';
import 'package:flemby/core/network/base_url_provider.dart';
import 'package:flemby/domain/services/device_service/device_service.dart';

class DioClient {
  late final Dio _dio;
  Dio get dio => _dio;

  final BaseUrlProvider _baseUrlProvider;

  final DeviceService _deviceService;

  DioClient(this._deviceService, this._baseUrlProvider) {
    _dio = Dio(
      BaseOptions(
        headers: {"Content-Type": "application/json"},
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? baseUrl = await _baseUrlProvider.getBaseUrl();
          if (baseUrl == null) throw Exception('Base url cannot be empty');
          options.baseUrl = baseUrl;

          final List<String> authArgs = [
            'Emby Client="Flemby"',
            'Device="${await _deviceService.getDeviceName()}"',
            'DeviceId="${await _deviceService.getDeviceId()}"',
            'Version="${await _deviceService.getAppVersion()}"',
          ];

          options.headers['X-Emby-Authorization'] = authArgs.join(', ');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          final statusCode = error.response?.statusCode;
          final dynamic data = error.response?.data;

          EmbyException? embyException;

          String message = 'Unknown Error';
          if (data is Map<String, dynamic> && data["ErrorMessage"] != null) {
            message = data["ErrorMessage"];
          } else if (data is String) {
            message = data;
          }

          switch (statusCode) {
            case 401:
              embyException = UnauthorizedException(message);
              break;
            default:
              if (statusCode != null) {
                embyException = EmbyException(message, statusCode: statusCode);
              }
          }

          if (embyException != null) {
            return handler.reject(error.copyWith(error: embyException));
          }

          return handler.next(error);
        },
      ),
    );
  }
}
