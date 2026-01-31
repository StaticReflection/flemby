// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emby_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbyAccountModel _$EmbyAccountModelFromJson(Map<String, dynamic> json) =>
    EmbyAccountModel(
      name: json['name'] as String,
      id: json['id'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$EmbyAccountModelToJson(EmbyAccountModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accessToken': instance.accessToken,
      'id': instance.id,
    };
