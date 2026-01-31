import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/repositories/account_repository.dart';

class GetSelectedEmbyAccountUseCase {
  final AccountRepository repository;
  GetSelectedEmbyAccountUseCase(this.repository);

  Future<EmbyAccount?> call(String serverId) =>
      repository.getSelectedEmbyAccount(serverId);
}
