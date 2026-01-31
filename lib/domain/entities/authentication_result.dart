import 'package:flemby/domain/entities/session_info.dart';
import 'package:flemby/domain/entities/user_dto.dart';

class AuthenticationResult {
  final UserDto user;
  final SessionInfo sessionInfo;
  final String accessToken;
  final String serverId;

  const AuthenticationResult({
    required this.user,
    required this.sessionInfo,
    required this.accessToken,
    required this.serverId,
  });
}
