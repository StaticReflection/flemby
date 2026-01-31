import 'package:json_annotation/json_annotation.dart';
import 'package:flemby/domain/entities/emby_server.dart';
import 'package:flemby/domain/entities/http_protocol.dart';

part 'emby_server_model.g.dart';

@JsonSerializable()
class EmbyServerModel extends EmbyServer {
  const EmbyServerModel({
    required super.id,
    required super.name,
    required super.protocol,
    required super.host,
    required super.port,
  });

  factory EmbyServerModel.fromEntity(EmbyServer entity) => EmbyServerModel(
    id: entity.id,
    name: entity.name,
    protocol: entity.protocol,
    host: entity.host,
    port: entity.port,
  );

  factory EmbyServerModel.fromJson(Map<String, dynamic> json) =>
      _$EmbyServerModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmbyServerModelToJson(this);
}
