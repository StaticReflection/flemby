import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/repositories/server_repository.dart';

class UpdateServerUseCase {
  final ServerRepository repository;
  UpdateServerUseCase(this.repository);

  Future<void> call(EmbyServer server) => repository.updateEmbyServer(server);
}
