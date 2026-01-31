import 'package:flemby/domain/entities/emby_account.dart';

abstract class AccountRepository {
  // Get all saved Emby account
  Future<List<EmbyAccount>> getEmbyAccountList(String serverId);

  // Save new Emby account
  Future<void> addEmbyAccount({
    required String serverId,
    required EmbyAccount account,
  });

  // Remove saved Emby account
  Future<void> removeEmbyAccount({
    required String serverId,
    required EmbyAccount account,
  });

  // Update/Edit saved Emby account
  Future<void> updateEmbyAccount({
    required String serverId,
    required EmbyAccount account,
  });

  // Save selected Emby account
  Future<void> saveSelectedEmbyAccount({
    required String serverId,
    required EmbyAccount? account,
  });

  // Get selected Emby account
  Future<EmbyAccount?> getSelectedEmbyAccount(String serverId);
}
