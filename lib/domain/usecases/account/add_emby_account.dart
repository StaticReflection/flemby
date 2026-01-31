import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/repositories/account_repository.dart';

class AddEmbyAccountUseCase {
  final AccountRepository repository;
  AddEmbyAccountUseCase(this.repository);

  Future<void> call({required String serverId, required EmbyAccount account}) =>
      repository.addEmbyAccount(serverId: serverId, account: account);
}
