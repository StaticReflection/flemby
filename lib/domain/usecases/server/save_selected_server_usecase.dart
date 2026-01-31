import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/repositories/server_repository.dart';

class SaveSelectedServerUseCase {
  final ServerRepository repository;
  SaveSelectedServerUseCase(this.repository);

  Future<void> call(EmbyServer? server) =>
      repository.saveSelectedServer(server);
}
