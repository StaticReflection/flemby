import 'package:flemby/core/network/base_url_provider.dart';
import 'package:flemby/data/models/emby_server_model.dart';
import 'package:flemby/data/sources/local/server_data_source.dart';
import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/repositories/server_repository.dart';
import 'package:uuid/uuid.dart';

class ServerRepositoryImpl implements ServerRepository, BaseUrlProvider {
  final ServerLocalDataSource localDataSource;

  ServerRepositoryImpl(this.localDataSource);

  @override
  Future<List<EmbyServer>> getEmbyServerList() async {
    return localDataSource.getServerList();
  }

  @override
  Future<void> addEmbyServer(EmbyServer server) async {
    final models = localDataSource.getServerList();

    final newModel = EmbyServerModel(
      id: const Uuid().v4(),
      name: server.name,
      protocol: server.protocol,
      host: server.host,
      port: server.port,
    );

    models.add(newModel);
    await localDataSource.saveServerList(models);
  }

  @override
  Future<void> removeEmbyServer(String id) async {
    final models = localDataSource.getServerList();
    models.removeWhere((m) => m.id == id);
    await localDataSource.saveServerList(models);

    final selected = localDataSource.getSelectedServer();
    if (selected?.id == id) {
      await localDataSource.removeSelectedServer();
    }
  }

  @override
  Future<void> updateEmbyServer(EmbyServer server) async {
    final models = localDataSource.getServerList();
    final index = models.indexWhere((m) => m.id == server.id);

    if (index != -1) {
      final model = EmbyServerModel.fromEntity(server);
      models[index] = model;
      await localDataSource.saveServerList(models);

      final currentSelected = localDataSource.getSelectedServer();
      if (currentSelected?.id == server.id) {
        await localDataSource.saveSelectedServer(model);
      }
    }
  }

  @override
  Future<void> saveSelectedServer(EmbyServer? server) async {
    final model = server != null ? EmbyServerModel.fromEntity(server) : null;

    await localDataSource.saveSelectedServer(model);
  }

  @override
  Future<EmbyServer?> getSelectedServer() async {
    return localDataSource.getSelectedServer();
  }

  @override
  Future<String?> getBaseUrl() async {
    final server = localDataSource.getSelectedServer();
    if (server == null) return null;
    return '${server.protocol}${server.host}:${server.port}/emby';
  }
}
