import 'package:flemby/data/models/emby_account_model.dart';
import 'package:flemby/data/sources/local/account_data_source.dart';
import 'package:flemby/domain/repositories/account_repository.dart';
import 'package:flemby/domain/entities/emby_account.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountLocalDataSource localDataSource;

  AccountRepositoryImpl(this.localDataSource);

  @override
  Future<List<EmbyAccount>> getEmbyAccountList(String serverId) async {
    return localDataSource.getEmbyAccountList(serverId);
  }

  @override
  Future<EmbyAccount?> getSelectedEmbyAccount(String serverId) async {
    return await localDataSource.getSelectedEmbyAccount(serverId);
  }

  @override
  Future<void> addEmbyAccount({
    required String serverId,
    required EmbyAccount account,
  }) async {
    final model = EmbyAccountModel.fromEntity(account);
    await localDataSource.saveEmbyAccount(serverId, model);
  }

  @override
  Future<void> updateEmbyAccount({
    required String serverId,
    required EmbyAccount account,
  }) async {
    final model = EmbyAccountModel.fromEntity(account);
    await localDataSource.updateEmbyAccount(serverId, model);

    final selected = await localDataSource.getSelectedEmbyAccount(serverId);
    if (selected?.id == account.id) {
      await localDataSource.saveSelectedEmbyAccount(
        serverId: serverId,
        account: model,
      );
    }
  }

  @override
  Future<void> removeEmbyAccount({
    required String serverId,
    required EmbyAccount account,
  }) async {
    final model = EmbyAccountModel.fromEntity(account);
    await localDataSource.removeEmbyAccount(serverId, model);

    final selected = await localDataSource.getSelectedEmbyAccount(serverId);
    if (selected?.id == account.id) {
      await (localDataSource).removeSelectedEmbyAccount(serverId);
    }
  }

  @override
  Future<void> saveSelectedEmbyAccount({
    required String serverId,
    required EmbyAccount? account,
  }) async {
    final model = account != null ? EmbyAccountModel.fromEntity(account) : null;

    await localDataSource.saveSelectedEmbyAccount(
      serverId: serverId,
      account: model,
    );
  }
}
