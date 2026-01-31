// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emby_server_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbyServerModel _$EmbyServerModelFromJson(Map<String, dynamic> json) =>
    EmbyServerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      protocol: $enumDecode(_$HttpProtocolEnumMap, json['protocol']),
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
    );

Map<String, dynamic> _$EmbyServerModelToJson(EmbyServerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'protocol': _$HttpProtocolEnumMap[instance.protocol]!,
      'host': instance.host,
      'port': instance.port,
    };

const _$HttpProtocolEnumMap = {
  HttpProtocol.http: 'http',
  HttpProtocol.https: 'https',
};
