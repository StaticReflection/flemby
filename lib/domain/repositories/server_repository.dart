import 'package:flemby/domain/entities/emby_server.dart';

abstract class ServerRepository {
  // Get all saved emby server
  Future<List<EmbyServer>> getEmbyServerList();

  // Add new Emby server
  Future<void> addEmbyServer(EmbyServer server);

  // Delete Emby server
  Future<void> removeEmbyServer(String id);

  // Edit Emby server
  Future<void> updateEmbyServer(EmbyServer server);

  // Save current selected Emby server
  Future<void> saveSelectedServer(EmbyServer? server);
  Future<EmbyServer?> getSelectedServer();
}
