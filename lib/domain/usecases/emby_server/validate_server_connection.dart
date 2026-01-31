import 'package:flemby/domain/repositories/emby_server_repository.dart';

class ValidateServerConnectionUseCase {
  final EmbyServerRepository repository;
  ValidateServerConnectionUseCase(this.repository);

  Future<void> call() async {
    await repository.getPublicSystemInfo();
  }
}
