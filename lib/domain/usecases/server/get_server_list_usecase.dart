import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/repositories/server_repository.dart';

class GetServerListUseCase {
  final ServerRepository repository;
  GetServerListUseCase(this.repository);

  Future<List<EmbyServer>> call() async {
    final servers = await repository.getEmbyServerList();
    servers.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );
    return servers;
  }
}
