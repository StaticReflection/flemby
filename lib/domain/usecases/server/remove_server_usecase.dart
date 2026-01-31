import 'package:flemby/domain/repositories/server_repository.dart';

class RemoveServerUseCase {
  final ServerRepository repository;
  RemoveServerUseCase(this.repository);

  Future<void> call(String id) => repository.removeEmbyServer(id);
}
