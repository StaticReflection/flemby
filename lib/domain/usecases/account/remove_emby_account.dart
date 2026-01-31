import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/repositories/account_repository.dart';

class RemoveEmbyAccountUseCase {
  final AccountRepository repository;
  RemoveEmbyAccountUseCase(this.repository);

  Future<void> call({required String serverId, required EmbyAccount account}) =>
      repository.removeEmbyAccount(serverId: serverId, account: account);
}
