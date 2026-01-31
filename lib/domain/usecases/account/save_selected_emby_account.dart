import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/repositories/account_repository.dart';

class SaveSelectedEmbyAccountUseCase {
  final AccountRepository repository;
  SaveSelectedEmbyAccountUseCase(this.repository);

  Future<void> call({
    required String serverId,
    required EmbyAccount? account,
  }) =>
      repository.saveSelectedEmbyAccount(serverId: serverId, account: account);
}
