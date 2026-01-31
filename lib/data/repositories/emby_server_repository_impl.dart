import 'package:flemby/data/sources/remote/emby_server_api_service.dart';
import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:flemby/domain/entities/authentication_result.dart';
import 'package:flemby/domain/entities/public_system_info.dart';
import 'package:flemby/domain/repositories/emby_server_repository.dart';

class EmbyServerRepositoryImpl implements EmbyServerRepository {
  final EmbyServerRemoteDataSource _embyServerApiServiceImpl;

  EmbyServerRepositoryImpl(this._embyServerApiServiceImpl);

  @override
  Future<PublicSystemInfo> getPublicSystemInfo() async {
    return await _embyServerApiServiceImpl.getPublicSystemInfo();
  }

  @override
  Future<AuthenticationResult> authenticateByName(
    AuthenticateUserByName user,
  ) async {
    return _embyServerApiServiceImpl.authenticateByName(user);
  }
}
