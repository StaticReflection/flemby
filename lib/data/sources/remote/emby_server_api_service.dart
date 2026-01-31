import 'package:dio/dio.dart';
import 'package:flemby/core/exceptions/emby_exception.dart';
import 'package:flemby/core/network/dio_client.dart';
import 'package:flemby/data/models/authenticate_user_by_name_model.dart';
import 'package:flemby/data/models/authentication_result_model.dart';
import 'package:flemby/data/models/public_system_info_model.dart';
import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:flemby/domain/entities/authentication_result.dart';
import 'package:flemby/domain/entities/public_system_info.dart';

abstract class EmbyServerRemoteDataSource {
  Future<PublicSystemInfo> getPublicSystemInfo();

  Future<AuthenticationResult> authenticateByName(AuthenticateUserByName user);
}

class EmbyServerRemoteDataSourceImpl implements EmbyServerRemoteDataSource {
  final DioClient _dioClient;

  EmbyServerRemoteDataSourceImpl(this._dioClient);

  @override
  Future<PublicSystemInfo> getPublicSystemInfo() async {
    final Response response = await _dioClient.dio.get('/system/info/public');

    return PublicSystemInfoModel.fromJson(response.data);
  }

  @override
  Future<AuthenticationResult> authenticateByName(
    AuthenticateUserByName user,
  ) async {
    try {
      final Response response = await _dioClient.dio.post(
        '/Users/AuthenticateByName',
        data: AuthenticateUserByNameModel.fromEntity(user).toJson(),
      );

      return AuthenticationResultModel.fromJson(response.data).toEntity();
    } on DioException catch (e) {
      if (e.error is EmbyException) {
        throw e.error as EmbyException;
      }
      rethrow;
    }
  }
}
