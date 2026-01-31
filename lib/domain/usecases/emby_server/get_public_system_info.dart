import 'package:flemby/domain/entities/public_system_info.dart';
import 'package:flemby/domain/repositories/emby_server_repository.dart';

class GetPublicSystemInfoUsecase {
  final EmbyServerRepository repository;
  GetPublicSystemInfoUsecase(this.repository);

  Future<PublicSystemInfo> call() async {
    return repository.getPublicSystemInfo();
  }
}
