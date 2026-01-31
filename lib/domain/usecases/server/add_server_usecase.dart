import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/repositories/server_repository.dart';

class AddServerUseCase {
  final ServerRepository repository;
  AddServerUseCase(this.repository);

  Future<void> call(EmbyServer server) => repository.addEmbyServer(server);
}
