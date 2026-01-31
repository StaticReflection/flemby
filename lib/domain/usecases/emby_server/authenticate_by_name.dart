import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:flemby/domain/entities/authentication_result.dart';
import 'package:flemby/domain/repositories/emby_server_repository.dart';

class AuthenticateByNameUseCase {
  final EmbyServerRepository repository;
  AuthenticateByNameUseCase(this.repository);

  Future<AuthenticationResult> call(AuthenticateUserByName user) async {
    return repository.authenticateByName(user);
  }
}
