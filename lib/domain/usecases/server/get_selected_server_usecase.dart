import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/repositories/server_repository.dart';

class GetSelectedServerUseCase {
  final ServerRepository repository;
  GetSelectedServerUseCase(this.repository);

  Future<EmbyServer?> call() => repository.getSelectedServer();
}
