import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:flemby/domain/entities/authentication_result.dart';
import 'package:flemby/domain/entities/public_system_info.dart';

abstract class EmbyServerRepository {
  Future<PublicSystemInfo> getPublicSystemInfo();

  Future<AuthenticationResult> authenticateByName(AuthenticateUserByName user);
}
