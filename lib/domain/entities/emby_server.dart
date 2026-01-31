import 'package:equatable/equatable.dart';
import 'package:flemby/domain/entities/http_protocol.dart';

class EmbyServer extends Equatable {
  final String id;
  final String name;
  final HttpProtocol protocol;
  final String host;
  final int port;

  const EmbyServer({
    required this.id,
    required this.name,
    required this.protocol,
    required this.host,
    required this.port,
  });

  @override
  List<Object?> get props => [id, name, host, port];
}
