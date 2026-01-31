import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/repositories/account_repository.dart';

class UpdateEmbyAccountUseCase {
  final AccountRepository repository;
  UpdateEmbyAccountUseCase(this.repository);

  Future<void> call({required String serverId, required EmbyAccount account}) =>
      repository.updateEmbyAccount(serverId: serverId, account: account);
}
