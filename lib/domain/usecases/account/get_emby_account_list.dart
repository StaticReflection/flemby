import 'package:flemby/domain/entities/emby_account.dart';
import 'package:flemby/domain/repositories/account_repository.dart';

class GetEmbyAccountListUseCase {
  final AccountRepository repository;
  GetEmbyAccountListUseCase(this.repository);

  Future<List<EmbyAccount>> call(String serverId) =>
      repository.getEmbyAccountList(serverId);
}
