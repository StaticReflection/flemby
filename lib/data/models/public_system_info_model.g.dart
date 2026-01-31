// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_system_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicSystemInfoModel _$PublicSystemInfoModelFromJson(
  Map<String, dynamic> json,
) => PublicSystemInfoModel(
  localAddress: json['LocalAddress'] as String?,
  localAddresses: (json['LocalAddresses'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  wanAddress: json['WanAddress'] as String?,
  remoteAddresses: (json['RemoteAddresses'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  serverName: json['ServerName'] as String,
  version: json['Version'] as String,
  id: json['Id'] as String,
);

Map<String, dynamic> _$PublicSystemInfoModelToJson(
  PublicSystemInfoModel instance,
) => <String, dynamic>{
  'LocalAddress': instance.localAddress,
  'LocalAddresses': instance.localAddresses,
  'WanAddress': instance.wanAddress,
  'RemoteAddresses': instance.remoteAddresses,
  'ServerName': instance.serverName,
  'Version': instance.version,
  'Id': instance.id,
};
